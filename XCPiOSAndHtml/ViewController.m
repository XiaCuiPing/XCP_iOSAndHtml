//
//  ViewController.m
//  XCPiOSAndHtml
//
//  Created by Apple on 2017/1/17.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize button = _button;

- (void)viewDidLoad {
    [super viewDidLoad];
    _button = [[UIButton alloc] initWithFrame:CGRectMake(80, 100, self.view.frame.size.width-160, 80)];
    [_button setTitle:@"点击查看" forState:UIControlStateNormal];
    _button.titleLabel.font = [UIFont systemFontOfSize:14.0];
    _button.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
    [_button addTarget:self action:@selector(clickedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];

}

- (void)clickedBtn:(UIButton *)button
{
    XCPIndexViewController *indexiOS = [[XCPIndexViewController alloc] init];
//    [self presentViewController:indexiOS animated:YES completion:nil];
    [self.navigationController pushViewController:indexiOS animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
