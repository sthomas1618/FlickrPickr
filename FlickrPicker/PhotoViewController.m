//
//  PhotoViewController.m
//  FlickrPicker
//
//  Created by Stephen Thomas on 10/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PhotoViewController.h"
#import "FlickrPhoto.h"
#import "FlickrFetcher.h"

@implementation PhotoViewController
@synthesize scrollView, photoView, photo, fetcher;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [scrollView setContentSize:CGSizeMake(photoView.frame.size.width,
                                          photoView.frame.size.height)];
    [scrollView setMaximumZoomScale:5];
    [scrollView setDelegate:self];
    
    [[self navigationItem] setTitle:photo.title];
    
    fetcher = [[FlickrFetcher alloc] init];
    photoView.image = [fetcher fetchImage:photo];
}

- (void)viewDidUnload
{
    [self setPhotoView:nil];
    [self setScrollView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait)
            ||  UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)sv{
    return photoView;
}

- (void)dealloc {
    [fetcher release];
    [photo release];
    [scrollView release];
    [photoView release];
    [super dealloc];
}

- (IBAction)composeEmail:(id)sender {
    UIActionSheet *actionEmail = [[UIActionSheet alloc] initWithTitle:@"Share Image" 
                                                             delegate:self 
                                                    cancelButtonTitle:@"Cancel" 
                                               destructiveButtonTitle:nil 
                                                    otherButtonTitles:@"Email", nil];
    actionEmail.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [actionEmail showInView:self.view];
    [actionEmail release];
}

-(void)  actionSheet:(UIActionSheet *)actionSheet 
clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        if ([MFMailComposeViewController canSendMail]) {
            
            NSString *title = [NSString stringWithString: [photo.title length] == 0 ? @"photo" : photo.title];
            NSData *imageData = UIImageJPEGRepresentation([photoView image], 1.0);
            
            MFMailComposeViewController *mailModal = [[MFMailComposeViewController alloc] init];
            mailModal.mailComposeDelegate = self;
            [mailModal setSubject:[NSString stringWithFormat:@"Flickr Photo: %@", title]];
            [mailModal setMessageBody:[NSString stringWithFormat:@"Attached: %@", title] isHTML:YES];
            [mailModal addAttachmentData:imageData mimeType:@"image/png" fileName:title];
            [self presentModalViewController:mailModal animated:YES];
            [mailModal release];
        } else {
            NSLog(@"Unable to send mail."); 
        }
        
    } 
}

-(void)mailComposeController:(MFMailComposeViewController*)controller 
         didFinishWithResult:(MFMailComposeResult)result 
                       error:(NSError*)error {
    // Check result of action. This confirms correct usage in simulator
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Email Cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Email saved for later");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Email sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Email failed");
            break;
        default:
        {
            UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Email" message:@"Result Failed - Unknown Error"
                                                           delegate:self 
                                                  cancelButtonTitle:@"OK" 
                                                  otherButtonTitles: nil];
            [errorAlert show];
            [errorAlert release];
        }
    }
    
    [self dismissModalViewControllerAnimated:YES];
}

@end
