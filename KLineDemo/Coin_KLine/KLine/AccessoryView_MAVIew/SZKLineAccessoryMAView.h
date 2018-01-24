//
//  SZKLineAccessoryMAView.h
//  KLineDemo
//
//  Created by Zahi on 2018/1/25.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SZKLineConstant.h"

@class SZKLineModel;
@interface SZKLineAccessoryMAView : UIView
+(instancetype)view;

-(void)maProfileWithModel:(SZKLineModel *)model;

/**
 *  Accessory指标种类
 */
@property (nonatomic, assign) SZKLineTargetLineStatus targetLineStatus;
@end
