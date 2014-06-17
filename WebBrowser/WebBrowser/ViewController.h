//
//  ViewController.h
//  WebBrowser
//
//  Created by iD Student on 6/17/14.
//  Copyright (c) 2014 iDTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *typeField;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)goButton:(id)sender;
- (IBAction)forward:(id)sender;
- (IBAction)back:(id)sender;
@end
