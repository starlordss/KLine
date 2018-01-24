//
//  SZKLine.h
//  KLineDemo
//
//  Created by Zahi on 2018/1/25.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZKLinePositionModel.h"
#import "SZKLineModel.h"


/**
 K线
 */
@interface SZKLine : NSObject


/**
 *  K线的位置model
 */
@property (nonatomic, strong) SZKLinePositionModel *kLinePositionModel;

/**
 *  k线的model
 */
@property (nonatomic, strong) SZKLineModel *kLineModel;

/**
 *  最大的Y
 */
@property (nonatomic, assign) CGFloat maxY;

/**
 *  根据context初始化
 */
- (instancetype)initWithContext:(CGContextRef)context;

/**
 *  绘制K线
 */
- (UIColor *)draw;

@end
