//
//  SZKLinePositionModel.h
//  KLineDemo
//
//  Created by chaobi on 2018/1/24.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SZKLinePositionModel : NSObject
/**
 *  开盘点
 */
@property (nonatomic, assign) CGPoint OpenPoint;

/**
 *  收盘点
 */
@property (nonatomic, assign) CGPoint ClosePoint;

/**
 *  最高点
 */
@property (nonatomic, assign) CGPoint HighPoint;

/**
 *  最低点
 */
@property (nonatomic, assign) CGPoint LowPoint;

/**
 *  工厂方法
 */
+ (instancetype) modelWithOpen:(CGPoint)openPoint close:(CGPoint)closePoint high:(CGPoint)highPoint low:(CGPoint)lowPoint;
@end
