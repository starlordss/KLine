//
//  SZKLineVolumePositionModel.m
//  KLineDemo
//
//  Created by chaobi on 2018/1/24.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#import "SZKLineVolumePositionModel.h"

@implementation SZKLineVolumePositionModel

+ (instancetype) modelWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint
{
    SZKLineVolumePositionModel *volumePositionModel = [SZKLineVolumePositionModel new];
    volumePositionModel.StartPoint = startPoint;
    volumePositionModel.EndPoint = endPoint;
    return volumePositionModel;
}

@end
