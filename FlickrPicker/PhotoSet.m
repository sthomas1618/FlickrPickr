//
//  PhotoSet.m
//  FlickrPicker
//
//  Created by Stephen Thomas on 10/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PhotoSet.h"
#import "FlickrFetcher.h"

@implementation PhotoSet
@synthesize photos;

- (id)init
{
    self = [super init];
    if(self) {
        photos = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)createListWithTag:(NSString *)tag
{
    fetcher = [[FlickrFetcher alloc] init];
    photos =  [fetcher fetchByTag:tag];
}
    
- (void)dealloc
{
    [photos release];
    [super dealloc];
}

@end
