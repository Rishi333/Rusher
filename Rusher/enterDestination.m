//
//  enterDestination.m
//  Rusher
//
//  Created by Rishi Bommu on 8/9/12.
//  Copyright (c) 2012 Mission. All rights reserved.
//

#import "enterDestination.h"
#import <CoreLocation/CoreLocation.h>
#import "MapViewController.h"
@interface enterDestination ()
@property (nonatomic,readonly, getter = isGeocoding) BOOL geocoding;
@property (nonatomic,strong) CLGeocoder *direction;
@property (nonatomic,strong) NSString *text;
@property (nonatomic,strong)CLPlacemark *placer;
@property (nonatomic, strong) MapViewController *maper;

@end

@implementation enterDestination
@synthesize maper;
@synthesize placer;
@synthesize Back = _Back;
@synthesize text;
@synthesize TextField = _TextField;
@synthesize Enter = _Enter;
@synthesize geocoding=_geocoding;
@synthesize direction;

-(IBAction)enterPressed:(id)sender{
    if(!(_TextField==nil)){
        text=_TextField.text;
        NSLog(@"the value of inputted text equals: %@", text);
        [direction geocodeAddressString:text completionHandler:^(NSArray *placemarks, NSError *error) {
            //enter code here that will do something after the geocode finds the adress
        NSLog(@"these are the placemarks : %@", placemarks);
            if (!(placemarks==nil)) {
                placer=[placemarks objectAtIndex:0];
               // [CLLocationCoordinate2D]
                [self.maper.mapView addAnnotations:placemarks];
             //   [self.maper addAnnotation:placemarks];
                
            }else {
                NSLog(@"placemarks returned null");}
        }];
}
}
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
}

- (void)viewDidUnload
{
    [self setEnter:nil];
    [self setBack:nil];
    [self setTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
