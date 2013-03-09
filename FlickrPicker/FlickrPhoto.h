//
//  FlickrPhoto.h
//  FlickrPicker
//
//  Created by Stephen Thomas on 10/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlickrPhoto : NSObject
{
    NSString  *photoId;
    NSString  *secret;
    NSInteger farmId;
    NSString  *serverId;
    NSString  *title;
    UIImage   *thumbnail;
}
@property (nonatomic, retain) NSString  *photoId;
@property (nonatomic, retain) NSString  *secret;
@property (nonatomic)         NSInteger farmId;
@property (nonatomic, retain) NSString  *serverId;
@property (nonatomic, retain) NSString  *title;
@property (nonatomic, retain) UIImage  *thumbnail;

@end
