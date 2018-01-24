//
//  SZKLineAccessory.m
//  KLineDemo
//
//  Created by Zahi on 2018/1/25.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#import "SZKLineAccessory.h"
#import "UIColor+SZKLine.h"
#import "SZKLineGlobalVariable.h"

@interface SZKLineAccessory()

@property (nonatomic, assign) CGContextRef context;

@end

@implementation SZKLineAccessory

- (instancetype)initWithContext:(CGContextRef)context
{
    self = [super init];
    if(self)
    {
        _context = context;
    }
    return self;
}
- (void)draw
{
    if(!self.kLineModel || !self.positionModel || !self.context || !self.lineColor)
    {
        return;
    }
    CGContextRef context = self.context;
    CGContextSetStrokeColorWithColor(context, [UIColor increaseColor].CGColor);
    CGContextSetLineWidth(context, [SZKLineGlobalVariable kLineWidth]);
    
    CGPoint solidPoints[] = {self.positionModel.StartPoint, self.positionModel.EndPoint};
    
    if(self.kLineModel.MACD.floatValue > 0)
    {
        CGContextSetStrokeColorWithColor(context, [UIColor decreaseColor].CGColor);
    }
    CGContextStrokeLineSegments(context, solidPoints, 2);
}

@end
