//
//  ViewController.m
//  TestHttpPeek
//
//  Created by jin on 15/5/19.
//  Copyright (c) 2015年 jinchen. All rights reserved.
//

#import "ViewController.h"
//#import <Macro.h>
//#import <HookUtil.h>
//#import <NSUtil.h>


@interface ViewController ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)initView
{
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height - 20)];
    self.webView.scalesPageToFit = YES;
    self.webView.userInteractionEnabled = YES;
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    [self loadWebPageWithString:@"http://app.yohoshow.com/"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadWebPageWithString:(NSString*)urlString
{
    
    NSURL *url =[NSURL URLWithString:urlString];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"request url is %@",request.URL);
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidStartLoad");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidFinishLoad");
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"didFailLoadWithError");
}
@end
