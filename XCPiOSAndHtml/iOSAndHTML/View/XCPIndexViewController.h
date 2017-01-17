//
//  XCPIndexViewController.h
//  XCPiOSAndHtml
//
//  Created by Apple on 2017/1/17.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XCPScrollViewSlider.h"
#import "XCPHTMLViewController.h"

@interface XCPIndexViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource,XCPScrollViewSliderDelegate>
{
    XCPScrollViewSlider *_slideView;
}

@property(nonatomic,readonly)UICollectionView *collectionView;


@end
