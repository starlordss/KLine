
//
//  SZKLineVolumeView.m
//  KLineDemo
//
//  Created by chaobi on 2018/1/24.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#import "SZKLineVolumeView.h"
#import "UIColor+SZKLine.h"
#import "SZKLineVolume.h"
#import "SZKLineVolumePositionModel.h"
#import "SZKLinePositionModel.h"
#import "SZMALine.h"


@interface SZKLineVolumeView ()

/**
 *  需要绘制的成交量的位置模型数组
 */
@property (nonatomic, strong) NSArray *needDrawKLineVolumePositionModels;

/**
 *  Volume_MA7位置数组
 */
@property (nonatomic, strong) NSMutableArray *Volume_MA7Positions;


/**
 *  Volume_MA7位置数组
 */
@property (nonatomic, strong) NSMutableArray *Volume_MA30Positions;

@end

@implementation SZKLineVolumeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor backgroundColor];
        self.Volume_MA7Positions = @[].mutableCopy;
        self.Volume_MA30Positions = @[].mutableCopy;
    }
    return self;
}

#pragma mark drawRect方法
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    if(!self.needDrawKLineVolumePositionModels)
    {
        return;
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    SZKLineVolume *kLineVolume = [[SZKLineVolume alloc]initWithContext:context];
    
    [self.needDrawKLineVolumePositionModels enumerateObjectsUsingBlock:^(SZKLineVolumePositionModel * _Nonnull volumePositionModel, NSUInteger idx, BOOL * _Nonnull stop) {
        kLineVolume.positionModel = volumePositionModel;
        kLineVolume.kLineModel = self.needDrawKLineModels[idx];
        kLineVolume.lineColor = self.kLineColors[idx];
        [kLineVolume draw];
    }];
    
    if(self.targetLineStatus != SZKLineTargetLineStatusCloseMA){
        SZMALine *MALine = [[SZMALine alloc]initWithContext:context];
        
        //画MA7线
        MALine.MAType = SZMA7Type;
        MALine.MAPositions = self.Volume_MA7Positions;
        [MALine draw];
        
        //画MA30线
        MALine.MAType = SZMA30Type;
        MALine.MAPositions = self.Volume_MA30Positions;
        [MALine draw];
    }
    
}

#pragma mark - 公有方法
#pragma mark 绘制volume方法
- (void)draw
{
    NSInteger kLineModelcount = self.needDrawKLineModels.count;
    NSInteger kLinePositionModelCount = self.needDrawKLinePositionModels.count;
    NSInteger kLineColorCount = self.kLineColors.count;
    NSAssert(self.needDrawKLineModels && self.needDrawKLinePositionModels && self.kLineColors && kLineColorCount == kLineModelcount && kLinePositionModelCount == kLineModelcount, @"数据异常，无法绘制Volume");
    self.needDrawKLineVolumePositionModels = [self private_convertToKLinePositionModelWithKLineModels:self.needDrawKLineModels];
    [self setNeedsDisplay];
}

#pragma mark - 私有方法
#pragma mark 根据KLineModel转换成Position数组
- (NSArray *)private_convertToKLinePositionModelWithKLineModels:(NSArray *)kLineModels
{
    CGFloat minY = SZKLineVolumeViewMinY;
    CGFloat maxY = SZKLineVolumeViewMaxY;
    
    SZKLineModel *firstModel = kLineModels.firstObject;
    
    __block CGFloat minVolume = firstModel.Volume;
    __block CGFloat maxVolume = firstModel.Volume;
    
    [kLineModels enumerateObjectsUsingBlock:^(SZKLineModel *  _Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if(model.Volume < minVolume)
        {
            minVolume = model.Volume;
        }
        
        if(model.Volume > maxVolume)
        {
            maxVolume = model.Volume;
        }
        if(model.Volume_MA7)
        {
            if (minVolume > model.Volume_MA7.floatValue) {
                minVolume = model.Volume_MA7.floatValue;
            }
            if (maxVolume < model.Volume_MA7.floatValue) {
                maxVolume = model.Volume_MA7.floatValue;
            }
        }
        if(model.Volume_MA30)
        {
            if (minVolume > model.Volume_MA30.floatValue) {
                minVolume = model.Volume_MA30.floatValue;
            }
            if (maxVolume < model.Volume_MA30.floatValue) {
                maxVolume = model.Volume_MA30.floatValue;
            }
        }
    }];
    
    CGFloat unitValue = (maxVolume - minVolume) / (maxY - minY);
    
    NSMutableArray *volumePositionModels = @[].mutableCopy;
    [self.Volume_MA7Positions removeAllObjects];
    [self.Volume_MA30Positions removeAllObjects];
    
    [kLineModels enumerateObjectsUsingBlock:^(SZKLineModel *  _Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
        SZKLinePositionModel *kLinePositionModel = self.needDrawKLinePositionModels[idx];
        CGFloat xPosition = kLinePositionModel.HighPoint.x;
        CGFloat yPosition = ABS(maxY - (model.Volume - minVolume)/unitValue);
        if(ABS(yPosition - SZKLineVolumeViewMaxY) < 0.5)
        {
            yPosition = SZKLineVolumeViewMaxY - 1;
        }
        CGPoint startPoint = CGPointMake(xPosition, yPosition);
        CGPoint endPoint = CGPointMake(xPosition, SZKLineVolumeViewMaxY);
        SZKLineVolumePositionModel *volumePositionModel = [SZKLineVolumePositionModel modelWithStartPoint:startPoint endPoint:endPoint];
        [volumePositionModels addObject:volumePositionModel];
        
        //MA坐标转换
        CGFloat ma7Y = maxY;
        CGFloat ma30Y = maxY;
        if(unitValue > 0.0000001)
        {
            if(model.Volume_MA7)
            {
                ma7Y = maxY - (model.Volume_MA7.floatValue - minVolume)/unitValue;
            }
            
        }
        if(unitValue > 0.0000001)
        {
            if(model.Volume_MA30)
            {
                ma30Y = maxY - (model.Volume_MA30.floatValue - minVolume)/unitValue;
            }
        }
        
        NSAssert(!isnan(ma7Y) && !isnan(ma30Y), @"出现NAN值");
        
        CGPoint ma7Point = CGPointMake(xPosition, ma7Y);
        CGPoint ma30Point = CGPointMake(xPosition, ma30Y);
        
        if(model.Volume_MA7)
        {
            [self.Volume_MA7Positions addObject: [NSValue valueWithCGPoint: ma7Point]];
        }
        if(model.Volume_MA30)
        {
            [self.Volume_MA30Positions addObject: [NSValue valueWithCGPoint: ma30Point]];
        }
    }];
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(kLineVolumeViewCurrentMaxVolume:minVolume:)])
    {
        [self.delegate kLineVolumeViewCurrentMaxVolume:maxVolume minVolume:minVolume];
    }
    return volumePositionModels;
}

@end
