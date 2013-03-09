//
//  TagSet.m
//  FlickrPicker
//
//  Created by Stephen Thomas on 10/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TagSet.h"

static TagSet *tags = nil;

@implementation TagSet

+ (TagSet *)tags
{
    if(!tags) {
        tags = [[super allocWithZone:NULL] init];
    }
    return tags;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self tags];
}

- (id)init
{
    if (tags) {
        return tags;
    }
    
    self = [super init];
    if(self) {
        NSString      *path = [[NSBundle mainBundle] pathForResource:@"tags" ofType:@"plist"];
        NSDictionary  *temp = [NSDictionary dictionaryWithContentsOfFile:path];
        sortedTags = [[NSArray alloc] initWithArray:[[temp allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)]];
    }
    
    return self;
}

- (NSArray *)sortedTags
{
    return sortedTags;
    
}

- (int)numberOfTags
{
    return [sortedTags count];
}

- (NSString *)getTagAt:(int)index
{
    return [sortedTags objectAtIndex:index];
}


#pragma mark Memory Mgmt

- (id)retain
{
    return self;
}

- (oneway void) release {}

- (NSUInteger)retainCount
{
    return NSUIntegerMax;
}

@end
