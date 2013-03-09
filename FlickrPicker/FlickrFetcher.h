//
//  FlickrFetcher.h
//  FlickrPicker
//
//  Created by Stephen Thomas on 10/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlickrPhoto.h"

extern NSString * const FLICKR_SEARCH;
extern NSString * const KEY;
extern NSString * const SECRET;

@class SBJsonParser;

@interface FlickrFetcher : NSObject
{
    SBJsonParser *parser;
}

+ (UIImage *)fetchThumbnail:(FlickrPhoto *)photo;
- (NSMutableArray *)fetchByTag:(NSString *)tag;
- (UIImage *)fetchImage:(FlickrPhoto *)photo;

@end
