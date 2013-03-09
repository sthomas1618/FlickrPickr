//
//  PhotoViewController.h
//  FlickrPicker
//
//  Created by Stephen Thomas on 10/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@class FlickrPhoto;
@class FlickrFetcher;

@interface PhotoViewController : UIViewController  <UIScrollViewDelegate, UIActionSheetDelegate, MFMailComposeViewControllerDelegate> {
    UIToolbar *toolbar;
    UIImageView *photoView;
    UIScrollView *scrollView;
    
    FlickrPhoto *photo;
    FlickrFetcher *fetcher;
}

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UIImageView *photoView;
@property (nonatomic, retain) FlickrPhoto *photo;
@property (nonatomic, retain) FlickrFetcher *fetcher;

- (IBAction)composeEmail:(id)sender;

@end