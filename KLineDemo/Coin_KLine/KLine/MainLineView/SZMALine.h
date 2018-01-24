//
//  SZMALine.h
//  KLineDemo
//
//  Created by chaobi on 2018/1/24.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZKLineModel.h"

typedef NS_ENUM(NSInteger, SZMAType){
    SZMA7Type = 0,
    SZMA30Type,
    SZBOLL_MB,
    SZBOLL_UP,
    SZBOLL_DN
};

@interface SZMALine : NSObject

@property (nonatomic, strong) NSArray *MAPositions;

@property (nonatomic, strong) NSArray *BOLLPositions;

@property (nonatomic, assign) SZMAType MAType;

/**
 *  k线的model
 */
@property (nonatomic, strong) SZKLineModel *kLineModel;

/**
 *  最大的Y
 */
@property (nonatomic, assign) CGFloat maxY;

/**
 *  根据context初始化均线画笔
 */
- (instancetype)initWithContext:(CGContextRef)context;

- (void)draw;

@end
