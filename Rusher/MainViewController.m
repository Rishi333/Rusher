//
//  MainViewController.m
//  Rusher
//
//  Created by Rishi Bommu on 7/30/12.
//  Copyright (c) 2012 Mission. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (nonatomic) UIApplication *App;
@end

@implementation MainViewController
@synthesize App;

@synthesize flipsidePopoverController = _flipsidePopoverController;
@synthesize Maps = _Maps;

-(IBAction)mapsPressed:(id)sender{
    //[App openURL:[NSURL URLWithString:@"http://maps.google.com/maps?q=London"]];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://maps.google.com/maps"]];

    NSLog(@"maps has been clicked");
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    self.navigationController.navigationBar.barStyle=UIBarStyleBlack;
    //} 
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setMaps:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
       // return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
        return NO;
    } else {
        return YES;
    }
}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self dismissModalViewControllerAnimated:YES];
    } else {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    }
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.flipsidePopoverController = nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            UIPopoverController *popoverController = [(UIStoryboardPopoverSegue *)segue popoverController];
            self.flipsidePopoverController = popoverController;
            popoverController.delegate = self;
        }
    }
}

- (IBAction)togglePopover:(id)sender
{
    if (self.flipsidePopoverController) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    } else {
        [self performSegueWithIdentifier:@"showAlternate" sender:sender];
    }
}

@end
