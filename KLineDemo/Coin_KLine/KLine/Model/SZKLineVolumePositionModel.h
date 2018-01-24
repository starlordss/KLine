//
//  SZKLineVolumePositionModel.h
//  KLineDemo
//
//  Created by chaobi on 2018/1/24.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SZKLineVolumePositionModel : NSObject
/**
 *  开始点
 */
@property (nonatomic, assign) CGPoint StartPoint;

/**
 *  结束点
 */
@property (nonatomic, assign) CGPoint EndPoint;

/**
 *  工厂方法
 */
+ (instancetype) modelWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;
@end
