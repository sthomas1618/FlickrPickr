//
//  FlickrFetcher.m
//  FlickrPicker
//
//  Created by Stephen Thomas on 10/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "FlickrFetcher.h"
#import "SBJson.h"
#import "FlickrPhoto.h"

NSString * const FLICKR_SEARCH = @"http://api.flickr.com/services/rest/?method=flickr.photos.search";
NSString * const KEY = @"your-key-here";
NSString * const SECRET = @"your-secret-here";

@implementation FlickrFetcher

+ (UIImage *)fetchThumbnail:(FlickrPhoto *)photo
{
    //http://farm{farm-id}.static.flickr.com/{server-id}/{id}_{secret}.jpg
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://farm%d.static.flickr.com/%@/%@_%@_t.jpg", photo.farmId, photo.serverId, photo.photoId, photo.secret]]; 
    return [UIImage imageWithData: [NSData dataWithContentsOfURL:url]];
}

- (NSMutableArray *)fetchByTag:(NSString *)tag
{
    NSString *escapedTag = [tag stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@&api_key=%@&tags=%@&format=json&nojsoncallback=1", FLICKR_SEARCH, KEY, escapedTag]]; 
    
    NSError *err = nil;
    NSString *json = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&err]; 
    if(!json) {
        NSLog(@"%@", [err localizedDescription]);
    }
    
    NSMutableArray * photoArray = [[NSMutableArray alloc] init];
    parser = [[SBJsonParser alloc] init];
    NSDictionary* temp = [NSDictionary dictionaryWithDictionary:[parser objectWithString:json]];
    if (temp) {
        NSArray *photoTextList =  [[temp objectForKey:@"photos"] objectForKey:@"photo"];
        for(NSDictionary * photoDict in photoTextList) {
            FlickrPhoto *photo = [[FlickrPhoto alloc] init];
            photo.photoId =   [photoDict objectForKey:@"id"];
            photo.farmId =    [[photoDict objectForKey:@"farm"] intValue];
            photo.serverId =  [photoDict objectForKey:@"server"];
            photo.secret =    [photoDict objectForKey:@"secret"];
            photo.title =     [photoDict objectForKey:@"title"];
            photo.thumbnail = [FlickrFetcher fetchThumbnail:photo];
            [photoArray addObject:photo];
        }
    } else {
        NSLog(@"An error occurred: %@", parser.error);
    }
    
    return photoArray;
}

- (UIImage *)fetchImage:(FlickrPhoto *)photo
{
    //http://farm{farm-id}.static.flickr.com/{server-id}/{id}_{secret}.jpg
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://farm%d.static.flickr.com/%@/%@_%@.jpg", photo.farmId, photo.serverId, photo.photoId, photo.secret]]; 
    return [UIImage imageWithData: [NSData dataWithContentsOfURL:url]];
}

@end
