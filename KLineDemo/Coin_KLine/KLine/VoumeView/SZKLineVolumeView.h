//
//  SZKLineVolumeView.h
//  KLineDemo
//
//  Created by chaobi on 2018/1/24.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SZKLineConstant.h"

@protocol SZKLineVolumeViewDelegate <NSObject>

@optional

/**
 *  当前VolumeView的最大值和最小值
 */
- (void)kLineVolumeViewCurrentMaxVolume:(CGFloat)maxVolume minVolume:(CGFloat)minVolume;

@end

@interface SZKLineVolumeView : UIView

/**
 * 需要绘制的K线模型数组
 */
@property (nonatomic, strong) NSArray *needDrawKLineModels;

/**
 * 需要绘制的K线位置数组
 */
@property (nonatomic, strong) NSArray *needDrawKLinePositionModels;

/**
 *  K线的颜色
 */
@property (nonatomic, strong) NSArray *kLineColors;

/**
 *  代理
 */
@property (nonatomic, weak) id<SZKLineVolumeViewDelegate> delegate;


/**
 *  Accessory指标种类
 */
@property (nonatomic, assign) SZKLineTargetLineStatus targetLineStatus;

/**
 *  绘制
 */
- (void)draw;

@end
