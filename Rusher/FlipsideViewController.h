//
//  FlipsideViewController.h
//  Rusher
//
//  Created by Rishi Bommu on 7/30/12.
//  Copyright (c) 2012 Mission. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

@interface FlipsideViewController : UIViewController
@property (strong, nonatomic, retain) IBOutlet UISwitch *mapStyle;
@property (weak, nonatomic) id <FlipsideViewControllerDelegate> delegate;
- (IBAction)switchHasBeenTouched:(id)sender;
- (IBAction)done:(id)sender;
-(BOOL)mapstyler;

@end
