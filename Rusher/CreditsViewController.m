//
//  CreditsViewController.m
//  Rusher
//
//  Created by Rishi Bommu on 7/30/12.
//  Copyright (c) 2012 Mission. All rights reserved.
//

#import "CreditsViewController.h"
@interface CreditsViewController ()
@property (nonatomic,retain) UIImageView *credits;
@end

@implementation CreditsViewController
@synthesize credits;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    }
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
