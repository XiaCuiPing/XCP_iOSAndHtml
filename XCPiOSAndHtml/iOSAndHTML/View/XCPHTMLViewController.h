//
//  XCPHTMLViewController.h
//  XCPiOSAndHtml
//
//  Created by Apple on 2017/1/17.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCPHTMLViewController : UIViewController <UIWebViewDelegate>

@property(nonatomic, retain)UIWebView *webView;
@property(nonatomic, strong)NSString *strnum;

@end
