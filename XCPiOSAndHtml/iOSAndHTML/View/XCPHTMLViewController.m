
//
//  XCPHTMLViewController.m
//  XCPiOSAndHtml
//
//  Created by Apple on 2017/1/17.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import "XCPHTMLViewController.h"

@interface XCPHTMLViewController ()

@end

@implementation XCPHTMLViewController

@synthesize webView = _webView;
@synthesize strnum = _strnum;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"信息详情"];
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
//    
//    self.navigationItem.leftBarButtonItem = [DSXUI barButtonWithStyle:DSXBarButtonStyleBack target:self action:@selector(back)];
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    _webView.delegate = self;
    _webView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _webView.scrollView.backgroundColor = [UIColor whiteColor];
    
    if ([_strnum isEqualToString:@"1"]) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"XCPHTMLOne" ofType:@"html"];
        NSURL *url = [NSURL URLWithString:filePath];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        [self.webView loadRequest:request];
    }
    else if ([_strnum isEqualToString:@"2"])
    {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"XCPHTMLTwo" ofType:@"html"];
        NSURL *url = [NSURL URLWithString:filePath];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        [self.webView loadRequest:request];
    }
    else
    {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"XCPHTMLThree" ofType:@"html"];
        NSURL *url = [NSURL URLWithString:filePath];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        [self.webView loadRequest:request];
    }
    
    [self.view addSubview:self.webView];
    
}

- (void)back{
    if (![self.navigationController popViewControllerAnimated:YES]) {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
