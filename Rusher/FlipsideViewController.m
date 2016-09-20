//
//  FlipsideViewController.m
//  Rusher
//
//  Created by Rishi Bommu on 7/30/12.
//  Copyright (c) 2012 Mission. All rights reserved.
//

#import "FlipsideViewController.h"

@interface FlipsideViewController ()
@property(nonatomic) BOOL Mapstyle;
@end

@implementation FlipsideViewController
@synthesize mapStyle;
@synthesize Mapstyle;
@synthesize delegate = _delegate;


- (void)awakeFromNib
{
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 480.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setMapStyle:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        //return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
        return NO;
    } else {
        return YES;
    }
}
-(BOOL)mapstyler{
    NSLog(@"mapstyler activated");
    return Mapstyle;
}

#pragma mark - Actions

- (IBAction)switchHasBeenTouched:(id)sender {
    NSLog(@"the switch has been clicked");
     
    if ([mapStyle isOn]) {
        self.mapstyle=YES;
    } else {
        self.mapstyle=NO;
        NSLog(@"mapstyle seturned false");
    }

//NSLog(@"bool===== %@",self.Mapstyle);
}

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
