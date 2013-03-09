//
//  TagSet.h
//  FlickrPicker
//
//  Created by Stephen Thomas on 10/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TagSet : NSObject
{
    NSArray *sortedTags;
}

+ (TagSet *)  tags;
- (NSArray *) sortedTags;
- (int)       numberOfTags;
- (NSString *)getTagAt:(int)index;

@end
