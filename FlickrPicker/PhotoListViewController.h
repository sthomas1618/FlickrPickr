//
//  PhotoListViewController.h
//  FlickrPicker
//
//  Created by Stephen Thomas on 10/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PhotoSet;
//@class FlickrFetcher;

@interface PhotoListViewController : UITableViewController <UITableViewDelegate>
{
    NSInteger tagIndex;
    PhotoSet *photoset;
}
@property (nonatomic) NSInteger tagIndex;

@end
