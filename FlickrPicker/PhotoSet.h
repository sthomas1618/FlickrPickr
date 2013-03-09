//
//  PhotoSet.h
//  FlickrPicker
//
//  Created by Stephen Thomas on 10/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FlickrFetcher;

@interface PhotoSet : NSObject
{
    NSMutableArray *photos;
    FlickrFetcher  *fetcher;
}

@property (nonatomic, readonly) NSMutableArray *photos;

- (void)createListWithTag:(NSString *)tag;

@end
