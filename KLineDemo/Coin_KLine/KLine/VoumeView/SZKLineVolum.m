//
//  SZKLineVolum.m
//  KLineDemo
//
//  Created by chaobi on 2018/1/24.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#import "SZKLineVolum.h"
#import "SZKLineGlobalVariable.h"

@interface SZKLineVolum ()

@property (nonatomic, assign) CGContextRef context;
@end

@implementation SZKLineVolum

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
    CGContextSetStrokeColorWithColor(context, self.lineColor.CGColor);
    CGContextSetLineWidth(context, [SZKLineGlobalVariable kLineWidth]);
    
    const CGPoint solidPoints[] = {self.positionModel.StartPoint, self.positionModel.EndPoint};
    CGContextStrokeLineSegments(context, solidPoints, 2);
}

@end
