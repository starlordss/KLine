//
//  SZKLineView.h
//  KLineDemo
//
//  Created by Zahi on 2018/1/25.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SZKLineModel.h"
#import "SZKLineConstant.h"

@interface SZKLineView : UIView

/**
 *  第一个View的高所占比例
 */
@property (nonatomic, assign) CGFloat mainViewRatio;

/**
 *  第二个View(成交量)的高所占比例
 */
@property (nonatomic, assign) CGFloat volumeViewRatio;

/**
 *  数据
 */
@property(nonatomic, copy) NSArray<SZKLineModel *> *kLineModels;

/**
 *  重绘
 */
- (void)reDraw;


/**
 *  K线类型
 */
@property (nonatomic, assign) SZKLineCenterViewType MainViewType;

/**
 *  Accessory指标种类
 */
@property (nonatomic, assign) SZKLineTargetLineStatus targetLineStatus;

@end
