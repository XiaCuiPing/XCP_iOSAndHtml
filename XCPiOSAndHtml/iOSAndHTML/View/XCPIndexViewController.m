//
//  XCPIndexViewController.m
//  XCPiOSAndHtml
//
//  Created by Apple on 2017/1/17.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import "XCPIndexViewController.h"

@interface XCPIndexViewController ()

@end

@implementation XCPIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;//_collectionView的高度
    [self.view addSubview:_collectionView];
    
    //图片轮播
    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    
    //注册头部视图
    [_collectionView registerClass:[XCPScrollViewSlider class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerCell"];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"aCell"];
}

- (void)scrollViewSlider:(XCPScrollViewSlider *)sliderView didSelectedItemWithData:(NSDictionary *)data
{
    NSString *Id = [data objectForKey:@"id"];
    if ([Id isEqualToString:@"0"]) {
        XCPHTMLViewController *homehtml = [[XCPHTMLViewController alloc] init];
        homehtml.strnum = @"1";
        [self.navigationController pushViewController:homehtml animated:YES];
    }
    else if([Id isEqualToString:@"1"])
    {
        XCPHTMLViewController *homehtml = [[XCPHTMLViewController alloc] init];
        homehtml.strnum = @"2";
        [self.navigationController pushViewController:homehtml animated:YES];
    }
    else
    {
        XCPHTMLViewController *homehtml = [[XCPHTMLViewController alloc] init];
        homehtml.strnum = @"3";
        [self.navigationController pushViewController:homehtml animated:YES];
    }
    
}

//头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    NSString *spath = [[NSBundle mainBundle] pathForResource:@"SliderImage" ofType:@"plist"];
    NSArray *sliderData = [NSArray arrayWithContentsOfFile:spath];
    UICollectionReusableView *reusableView = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        XCPScrollViewSlider *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerCell" forIndexPath:indexPath];
        headerView.backgroundColor = [UIColor clearColor];
        //headerView.frame = CGRectMake(0, 0, SWIDTH, 200);
        reusableView = headerView;
        headerView.delegate = self;
        headerView.dataList =sliderData;
    }
    return reusableView;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}


//横向
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumIntxeritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0.001;
}

//纵向
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0.001;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"aCell" forIndexPath:indexPath];
    return cell;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
