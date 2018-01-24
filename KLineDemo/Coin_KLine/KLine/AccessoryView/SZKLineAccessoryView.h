//
//  SZAccessoryView.h
//  KLineDemo
//
//  Created by Zahi on 2018/1/25.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SZKLineConstant.h"

@protocol SZKLineAccessoryViewDelegate <NSObject>

@optional

/**
 *  当前AccessoryView的最大值和最小值
 */
- (void)kLineAccessoryViewCurrentMaxValue:(CGFloat)maxValue minValue:(CGFloat)minValue;

@end
@interface SZKLineAccessoryView : UIView


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
@property (nonatomic, weak) id<SZKLineAccessoryViewDelegate> delegate;

/**
 *  Accessory指标种类
 */
@property (nonatomic, assign) SZKLineTargetLineStatus targetLineStatus;

/**
 *  绘制
 */
- (void)draw;

@end
