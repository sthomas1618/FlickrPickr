//
//  FlickrPhoto.m
//  FlickrPicker
//
//  Created by Stephen Thomas on 10/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "FlickrPhoto.h"


@implementation FlickrPhoto
@synthesize photoId, secret, farmId, serverId, title, thumbnail;

- (void)dealloc
{
    [title release];
    [photoId release];
    [secret release];
    [serverId release];
    [title release];
    [thumbnail release];
    [super dealloc];
}

@end
