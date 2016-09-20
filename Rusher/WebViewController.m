//
//  WebViewController.m
//  Rusher
//
//  Created by Rishi Bommu on 7/31/12.
//  Copyright (c) 2012 Mission. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController
@synthesize MAP;

-(IBAction)Buttons:(id)sender{
       NSLog(@"ONE of the buttons has been clicked");
    NSLog(@"%@",sender);
    NSString *temp=[(UIBarButtonItem *)sender title];
    if ([temp isEqualToString:@"Google"]){
        NSString *urlAddress = @"http:google.com";
        NSURL *url=[NSURL URLWithString:urlAddress];
        NSURLRequest *requestObj=[NSURLRequest requestWithURL:url];
        [webView loadRequest:requestObj]; 
    }
    else if ([temp isEqualToString:@"BACK"]) {
        NSLog(@"Back button has been clicked");
        [webView goBack];
    }
    else if ([temp isEqualToString:@"Reload"]) {
        [webView reload];
    }
    else if ([temp isEqualToString:@"Forward"]) {
        [webView goForward];
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
    NSString *urlAddress = @"http:google.com";
    NSURL *url=[NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj=[NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObj];
}

- (void)viewDidUnload
{
    google = nil;
    back = nil;
    reload = nil;
    forward = nil;
    toolbar = nil;
    Search = nil;
    [self setMAP:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    //[self updateButtons];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
  //[self updateButtons];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    //[self updateButtons];
}

@end
