//
//  ViewController.m
//  HLJTest
//
//  Created by tongxuan on 16/8/29.
//  Copyright © 2016年 tongxuan. All rights reserved.
//

#import "ViewController.h"
#import "SSlideTableView.h"
#import "TestTableCell.h"


@interface ViewController ()<SSlideTableViewDelegate>
{
    BOOL end;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    SSlideTableView * slideTables = [SSlideTableView new];
    slideTables.frame = CGRectMake(100, 200, 200, 400);
    slideTables.delegate = self;
    [slideTables registerClass:[TestTableCell class] forCellWithReuseIdentifier:@"TestTableCell"];
    [self.view addSubview:slideTables];

}

- (NSInteger)slideTableView:(SSlideTableView *)slideTableView numberOfItemsInSection:(NSInteger)section {
    return 5;
}
- (SSlideTableBaseCell *)slideTableView:(SSlideTableView *)slideTableView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TestTableCell * cell = (TestTableCell *)[slideTableView dequeueReusableCellWithReuseIdentifier:@"TestTableCell" forIndexPath:indexPath];
    
//    [cell.tableView reloadData];
    
    return cell;
}

- (void)sscrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    NSLog(@" !! -- %f",scrollView.contentOffset.x/200.);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
