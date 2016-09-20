//
//  MainViewController.h
//  Rusher
//
//  Created by Rishi Bommu on 7/30/12.
//  Copyright (c) 2012 Mission. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;
@property (strong, nonatomic) IBOutlet UIButton *Maps;
-(IBAction)mapsPressed:(id)sender;
@end
