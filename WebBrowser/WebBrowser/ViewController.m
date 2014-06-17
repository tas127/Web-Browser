//
//  ViewController.m
//  WebBrowser
//
//  Created by iD Student on 6/17/14.
//  Copyright (c) 2014 iDTech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.webView setDelegate:self];
    userDefaults = [NSUserDefaults standardUserDefaults];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goButton:(id)sender {
    NSString *urlString = self.typeField.text;
    NSURL *url;
    
    if([urlString hasPrefix:@"http://"] || [urlString hasPrefix:@"http:/"] || [urlString hasPrefix:@"http:"]) {
        url = [NSURL URLWithString:urlString];
    }else {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", self.typeField.text]];
    }
    
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url];
    [self.webView loadRequest:urlRequest];
}

- (IBAction)forward:(id)sender {
    [self.webView goForward];
}

- (IBAction)back:(id)sender {
    [self.webView goBack];
}

- (void) webViewDidFinishLoad:(UIWebView *)webView {
    [self.typeField setText:webView.request.URL.absoluteString];
}

- (IBAction)tapHome:(id)sender {
    NSString *homePage = [userDefaults StringforKey:@"Home Page"];
    if(homePage) {
        NSURL *url = [NSURL URLWithString:homePage];
        NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url];
        [self.webView loadRequest:urlRequest];
    } else {
        [userDefaults setObject:self.typeField.text forKey:@"Home Page"];
    }
}

@end
