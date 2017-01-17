//
//  XCPScrollViewSlider.m
//  XCPiOSAndHtml
//
//  Created by Apple on 2017/1/17.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import "XCPScrollViewSlider.h"

@implementation XCPScrollViewSlider

@synthesize scrollView  = _scrollView;
@synthesize pageControl = _pageControl;
@synthesize dataList = _dataList;

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor grayColor];
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
        _scrollView.bounces = NO;
        
        [self addSubview:_scrollView];
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((frame.size.width-100)/2, frame.size.height-30, self.frame.size.width, 20)];
        [_pageControl addTarget:self action:@selector(pageControlClick:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_pageControl];
    }
    return self;
}

- (void)setDataList:(NSArray *)dataList{
    _dataList = dataList;
    
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    
    if ([dataList count] == 0) {
        return;
    }
    
    for (int i = 0; i < [dataList count]; i++) {
        NSDictionary *dict = [dataList objectAtIndex:i];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(w*i, 0, w, h)];
        imageView.image = [UIImage imageNamed:[dict objectForKey:@"image"]];
        imageView.contentMode = UIViewContentModeScaleToFill;
        [imageView setTag:i];
        [_scrollView addSubview:imageView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewTap:)];
        [imageView addGestureRecognizer:tap];
        [imageView setUserInteractionEnabled:YES];
    }
    
    [_scrollView setContentSize:CGSizeMake(w*[_dataList count], 0)];
    _pageControl.numberOfPages = [_dataList count];
    [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(autoPlay) userInfo:nil repeats:YES];
    
}
- (void)imageViewTap:(UITapGestureRecognizer *)tap{
    //    NSLog(@"%ld",tap.view.tag);
    if ([_delegate respondsToSelector:@selector(scrollViewSlider:didSelectedItemWithData:)]) {
        [_delegate scrollViewSlider:self didSelectedItemWithData:[_dataList objectAtIndex:tap.view.tag]];
    }
}

- (void)autoPlay{
    NSInteger index = _pageControl.currentPage;
    index++;
    [self scrollTo:index];
}

- (void)scrollTo:(NSInteger)index{
    BOOL animated = YES;
    if (index >= _pageControl.numberOfPages) {
        index = 0;
        animated = NO;
    }else {
        animated = YES;
    }
    _pageControl.currentPage = index;
    [_scrollView setContentOffset:CGPointMake(self.frame.size.width*index, 0) animated:animated];
}



- (void)pageControlClick:(UIPageControl *)sender{
    [self scrollTo:sender.currentPage];
}


#pragma mark - scrollView delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = self.scrollView.contentOffset.x/self.frame.size.width;
    [_pageControl setCurrentPage:index];
}


@end
