//
//  enterDestination.h
//  Rusher
//
//  Created by Rishi Bommu on 8/9/12.
//  Copyright (c) 2012 Mission. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface enterDestination : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *Back;

@property (strong, nonatomic) IBOutlet UITextField *TextField;
@property (strong, nonatomic) IBOutlet UIButton *Enter;
-(IBAction)enterPressed:(id)sender;
@end
