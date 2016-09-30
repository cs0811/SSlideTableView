//
//  SSlideTableView.m
//  HLJTest
//
//  Created by tongxuan on 16/9/30.
//  Copyright © 2016年 tongxuan. All rights reserved.
//

#import "SSlideTableView.h"
#import "SSlideTableBaseCell.h"

@interface SSlideTableView ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView * collectionView;
@end

@implementation SSlideTableView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self loadBaseUI];
    }
    return  self;
}

- (void)loadBaseUI {
    [self addSubview:self.collectionView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.collectionView.frame = self.bounds;
}

#pragma mark UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if ([self.delegate respondsToSelector:@selector(numberOfSectionsInSlideTableView:)]) {
        return [self.delegate numberOfSectionsInSlideTableView:self];
    }
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if ([self.delegate respondsToSelector:@selector(slideTableView:numberOfItemsInSection:)]) {
        return [self.delegate slideTableView:self numberOfItemsInSection:section];
    }
    return 0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(slideTableView:cellForItemAtIndexPath:)]) {
        SSlideTableBaseCell * cell = [self.delegate slideTableView:self cellForItemAtIndexPath:indexPath];
        if (!cell) {
            cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SSlideTableBaseCell" forIndexPath:indexPath];
            cell.backgroundColor = [UIColor cyanColor];
        }
        return cell;
    }
    SSlideTableBaseCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SSlideTableBaseCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor cyanColor];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.bounds.size;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

#pragma mark ScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([self.delegate respondsToSelector:@selector(sscrollViewDidScroll:)]) {
        [self.delegate sscrollViewDidScroll:self.collectionView];
    }
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    if ([self.delegate respondsToSelector:@selector(sscrollViewDidZoom:)]) {
        [self.delegate sscrollViewDidZoom:self.collectionView];
    }
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if ([self.delegate respondsToSelector:@selector(sscrollViewWillBeginDragging:)]) {
        [self.delegate sscrollViewWillBeginDragging:self.collectionView];
    }
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset  {
    if ([self.delegate respondsToSelector:@selector(sscrollViewWillEndDragging:withVelocity:targetContentOffset:)]) {
        [self.delegate sscrollViewWillEndDragging:self.collectionView withVelocity:velocity targetContentOffset:targetContentOffset];
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if ([self.delegate respondsToSelector:@selector(sscrollViewDidEndDragging:willDecelerate:)]) {
        [self.delegate sscrollViewDidEndDragging:self.collectionView willDecelerate:decelerate];
    }
}
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    if ([self.delegate respondsToSelector:@selector(sscrollViewWillBeginDecelerating:)]) {
        [self.delegate sscrollViewWillBeginDecelerating:self.collectionView];
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if ([self.delegate respondsToSelector:@selector(sscrollViewDidEndDecelerating:)]) {
        [self.delegate sscrollViewDidEndDecelerating:self.collectionView];
    }
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    if ([self.delegate respondsToSelector:@selector(sscrollViewDidEndScrollingAnimation:)]) {
        [self.delegate sscrollViewDidEndScrollingAnimation:self.collectionView];
    }
}
- ( UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    if ([self.delegate respondsToSelector:@selector(sviewForZoomingInScrollView:)]) {
        return [self.delegate sviewForZoomingInScrollView:self.collectionView];
    }
    return nil;
}
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view {
    if ([self.delegate respondsToSelector:@selector(sscrollViewWillBeginZooming:withView:)]) {
        [self.delegate sscrollViewWillBeginZooming:self.collectionView withView:view];
    }
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    if ([self.delegate respondsToSelector:@selector(sscrollViewDidEndZooming:withView:atScale:)]) {
        [self.delegate sscrollViewDidEndZooming:self.collectionView withView:view atScale:scale];
    }
}


#pragma mark action
- (void)registerClass:(Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier {
    [self.collectionView registerClass:cellClass forCellWithReuseIdentifier:identifier];
}
- (SSlideTableBaseCell *)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    return [self.collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
}

#pragma mark getter
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [UICollectionViewFlowLayout new];
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
                
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
        [_collectionView registerClass:[SSlideTableBaseCell class] forCellWithReuseIdentifier:@"SSlideTableBaseCell"];
    }
    return _collectionView;
}

@end
