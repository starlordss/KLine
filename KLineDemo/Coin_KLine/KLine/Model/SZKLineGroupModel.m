//
//  SZKLineGroupModel.m
//  KLineDemo
//
//  Created by chaobi on 2018/1/24.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#import "SZKLineGroupModel.h"
#import "SZKLineModel.h"

@implementation SZKLineGroupModel
+ (instancetype) objectWithArray:(NSArray *)arr {
    
    NSAssert([arr isKindOfClass:[NSArray class]], @"arr不是一个数组");
    
    SZKLineGroupModel *groupModel = [SZKLineGroupModel new];
    NSMutableArray *mutableArr = @[].mutableCopy;
    __block SZKLineModel *preModel = [[SZKLineModel alloc]init];
    
    //设置数据
    for (NSDictionary *dict in arr)
    {
        SZKLineModel *model = [SZKLineModel new];
        model.PreviousKlineModel = preModel;
        //        [model initWithArray:valueArr];
        [model initWithDict:dict];
        model.ParentGroupModel = groupModel;
        
        [mutableArr addObject:model];
        
        preModel = model;
    }
    
    groupModel.models = mutableArr;
    
    //初始化第一个Model的数据
    SZKLineModel *firstModel = mutableArr[0];
    [firstModel initFirstModel];
    
    //初始化其他Model的数据
    [mutableArr enumerateObjectsUsingBlock:^(SZKLineModel *model, NSUInteger idx, BOOL * _Nonnull stop) {
        [model initData];
    }];
    
    return groupModel;
}

@end
