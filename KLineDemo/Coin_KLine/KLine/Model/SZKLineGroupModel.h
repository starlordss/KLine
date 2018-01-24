//
//  SZKLineGroupModel.h
//  KLineDemo
//
//  Created by chaobi on 2018/1/24.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SZKLineModel;

@interface SZKLineGroupModel : NSObject

@property (nonatomic, copy) NSArray<SZKLineModel *> *models;

//初始化Model
+ (instancetype) objectWithArray:(NSArray *)arr;

@end
