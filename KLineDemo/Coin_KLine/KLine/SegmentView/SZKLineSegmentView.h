//
//  SZKLineSegmentView.h
//  KLineDemo
//
//  Created by chaobi on 2018/1/24.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SZKLineSegmentView;
@protocol SZKLineSegmentViewDelegate <NSObject>

- (void)kLineSegmentView:(SZKLineSegmentView *)segmentView clickSegmentButtonIndex:(NSInteger)index;

@end


@interface SZKLineSegmentView : UIView

- (instancetype)initWithItems:(NSArray *)items;

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, weak) id <SZKLineSegmentViewDelegate> delegate;

@property (nonatomic, assign) NSUInteger selectedIndex;

@end
