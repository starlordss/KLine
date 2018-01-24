//
//  SZKLineAccessory.h
//  KLineDemo
//
//  Created by Zahi on 2018/1/25.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZKLineModel.h"
#import "SZKLineVolumePositionModel.h"

@interface SZKLineAccessory : NSObject
/**
 *  位置model
 */
@property (nonatomic, strong) SZKLineVolumePositionModel *positionModel;

/**
 *  k线model
 */
@property (nonatomic, strong) SZKLineModel *kLineModel;

/**
 *  线颜色
 */
@property (nonatomic, strong) UIColor *lineColor;

/**
 *  根据context初始化均线画笔
 */
- (instancetype)initWithContext:(CGContextRef)context;

/**
 *  绘制成交量
 */
- (void)draw;

@end
