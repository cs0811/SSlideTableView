//
//  SSlideTableCell.m
//  HLJTest
//
//  Created by tongxuan on 16/9/30.
//  Copyright © 2016年 tongxuan. All rights reserved.
//

#import "SSlideTableBaseCell.h"

@interface SSlideTableBaseCell ()

@end

@implementation SSlideTableBaseCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self loadBaseUI];
    }
    return  self;
}

- (void)loadBaseUI {
//    [self addSubview:self.tableView];
}

@end
