//
//  XCPScrollViewSlider.h
//  XCPiOSAndHtml
//
//  Created by Apple on 2017/1/17.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XCPScrollViewSlider;
@protocol XCPScrollViewSliderDelegate<NSObject>
@optional
- (void)scrollViewSlider:(XCPScrollViewSlider *)sliderView didSelectedItemWithData:(NSDictionary *)data;
@end


@interface XCPScrollViewSlider : UICollectionViewCell <UIScrollViewDelegate>


@property(nonatomic,readonly)UIScrollView *scrollView;
@property(nonatomic,retain)UIPageControl *pageControl;
@property(nonatomic,strong)NSArray *dataList;

@property(nonatomic,assign)id<XCPScrollViewSliderDelegate>delegate;

@end
