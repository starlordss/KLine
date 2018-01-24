//
//  ViewController.m
//  KLineDemo
//
//  Created by chaobi on 2018/1/24.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#import "ViewController.h"
#import "SZKLineSegmentView.h"

@interface ViewController ()<SZKLineSegmentViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SZKLineSegmentView *view = [[SZKLineSegmentView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    view.delegate = self;
    [self.view addSubview:view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)kLineSegmentView:(SZKLineSegmentView *)segmentView clickSegmentButtonIndex:(NSInteger)index
{
    
}
@end
