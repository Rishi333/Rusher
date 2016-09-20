//
//  WebViewController.h
//  Rusher
//
//  Created by Rishi Bommu on 7/31/12.
//  Copyright (c) 2012 Mission. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController{


IBOutlet UIWebView *webView;
IBOutlet UIBarButtonItem *google;
IBOutlet UIBarButtonItem *back;
IBOutlet UIBarButtonItem *reload;
IBOutlet UIBarButtonItem *forward;
IBOutlet UIToolbar *toolbar;
IBOutlet UISearchBar *Search;
    

}
-(IBAction)Buttons:(id)sender;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *MAP;

@end
