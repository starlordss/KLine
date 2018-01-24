//
//  SZKLineView.m
//  KLineDemo
//
//  Created by Zahi on 2018/1/25.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#import "SZKLineView.h"
#import "SZKLineMainView.h"
#import "SZKLineMAView.h"
#import "SZVolumeMAView.h"
#import "SZKLineAccessoryMAView.h"
#import "SZKLineVolumeView.h"
#import "SZKLineRightView.h"
#import "SZKLineAccessoryView.h"

#import <Masonry.h>
#import "UIColor+SZKLine.h"

#import "SZKLineGlobalVariable.h"


@interface SZKLineView() <UIScrollViewDelegate, SZKLineMainViewDelegate, SZKLineVolumeViewDelegate, SZKLineAccessoryViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
/**
 *  主K线图
 */
@property (nonatomic, strong) SZKLineMainView *kLineMainView;

/**
 *  成交量图
 */
@property (nonatomic, strong) SZKLineVolumeView *kLineVolumeView;

/**
 *  副图
 */
@property (nonatomic, strong) SZKLineAccessoryView *kLineAccessoryView;

/**
 *  右侧价格图
 */
@property (nonatomic, strong) SZKLineRightView *priceView;

/**
 *  右侧成交量图
 */
@property (nonatomic, strong) SZKLineRightView *volumeView;

/**
 *  右侧Accessory图
 */
@property (nonatomic, strong) SZKLineRightView *accessoryView;

/**
 *  旧的scrollview准确位移
 */
@property (nonatomic, assign) CGFloat oldExactOffset;

/**
 *  kLine-MAView
 */
@property (nonatomic, strong) SZKLineMAView *kLineMAView;

/**
 *  Volume-MAView
 */
@property (nonatomic, strong) SZVolumeMAView *volumeMAView;

/**
 *  Accessory-MAView
 */
@property (nonatomic, strong) SZKLineAccessoryMAView *accessoryMAView;

/**
 *  长按后显示的View
 */
@property (nonatomic, strong) UIView *verticalView;


@property (nonatomic, strong) MASConstraint *kLineMainViewHeightConstraint;

@property (nonatomic, strong) MASConstraint *kLineVolumeViewHeightConstraint;

@property (nonatomic, strong) MASConstraint *priceViewHeightConstraint;

@property (nonatomic, strong) MASConstraint *volumeViewHeightConstraint;

@end


@implementation SZKLineView


@end
