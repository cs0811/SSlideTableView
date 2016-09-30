//
//  SSlideTableView.h
//  HLJTest
//
//  Created by tongxuan on 16/9/30.
//  Copyright © 2016年 tongxuan. All rights reserved.
//

#import <UIKit/UIKit.h>


@class SSlideTableView;
@class SSlideTableBaseCell;

@protocol SSlideTableViewDelegate <NSObject>

@optional
- (NSInteger)numberOfSectionsInSlideTableView:(SSlideTableView *)slideTableView;
- (NSInteger)slideTableView:(SSlideTableView *)slideTableView numberOfItemsInSection:(NSInteger)section;
- (SSlideTableBaseCell *)slideTableView:(SSlideTableView *)slideTableView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

// ScrollViewDelegate
- (void)sscrollViewDidScroll:(UIScrollView *)scrollView;
- (void)sscrollViewDidZoom:(UIScrollView *)scrollView NS_AVAILABLE_IOS(3_2);
- (void)sscrollViewWillBeginDragging:(UIScrollView *)scrollView;
- (void)sscrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0);
- (void)sscrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;
- (void)sscrollViewWillBeginDecelerating:(UIScrollView *)scrollView;
- (void)sscrollViewDidEndDecelerating:(UIScrollView *)scrollView;
- (void)sscrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView;
- ( UIView *)sviewForZoomingInScrollView:(UIScrollView *)scrollView;
- (void)sscrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view NS_AVAILABLE_IOS(3_2);
- (void)sscrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale;

@end

@interface SSlideTableView : UIView

@property (nonatomic, weak) id<SSlideTableViewDelegate> delegate;

- (void)registerClass:(Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier;

- (SSlideTableBaseCell *)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;

@end
