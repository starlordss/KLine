//
//  SZMALine.m
//  KLineDemo
//
//  Created by chaobi on 2018/1/24.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#import "SZMALine.h"
#import "UIColor+SZKLine.h"
#import "SZKLineConstant.h"
@interface SZMALine ()

@property (nonatomic, assign) CGContextRef context;
/**
 *  最后一个绘制日期点
 */
@property (nonatomic, assign) CGPoint lastDrawDatePoint;
@end

@implementation SZMALine

/**
*  根据context初始化画线
*/
- (instancetype)initWithContext:(CGContextRef)context
{
    self = [super init];
    if(self)
    {
        self.context = context;
    }
    return self;
}

- (void)draw
{
    if(!self.context)
    {
        return;
    }
    
    if (_MAType == SZBOLL_DN || _MAType == SZBOLL_MB || _MAType == SZBOLL_UP){
        if(!self.BOLLPositions) {
            return;
        }
        
        
        UIColor *lineColor = self.MAType == SZBOLL_UP? [UIColor BOLL_UPColor] : (self.MAType == SZBOLL_MB ? [UIColor BOLL_MBColor] : self.MAType == SZBOLL_DN ? [UIColor BOLL_DNColor] : [UIColor mainTextColor]);
        
        CGContextSetStrokeColorWithColor(self.context, lineColor.CGColor);
        
        CGContextSetLineWidth(self.context, SZKLineMALineWidth);
        
        CGPoint firstPoint = [self.BOLLPositions.firstObject CGPointValue];
        NSAssert(!isnan(firstPoint.x) && !isnan(firstPoint.y), @"出现NAN值：BOLL画线");
        CGContextMoveToPoint(self.context, firstPoint.x, firstPoint.y);
        
        for (NSInteger idx = 1; idx < self.BOLLPositions.count ; idx++)
        {
            CGPoint point = [self.BOLLPositions[idx] CGPointValue];
            CGContextAddLineToPoint(self.context, point.x, point.y);
        }
        
        
    } else {
        if(!self.MAPositions) {
            return;
        }
        
        UIColor *lineColor = self.MAType == SZMA7Type ? [UIColor ma7Color] : (self.MAType == SZMA30Type ? [UIColor ma30Color] : [UIColor mainTextColor]);
        
        CGContextSetStrokeColorWithColor(self.context, lineColor.CGColor);
        
        CGContextSetLineWidth(self.context, SZKLineMALineWidth);
        
        CGPoint firstPoint = [self.MAPositions.firstObject CGPointValue];
        NSAssert(!isnan(firstPoint.x) && !isnan(firstPoint.y), @"出现NAN值：MA画线");
        CGContextMoveToPoint(self.context, firstPoint.x, firstPoint.y);
        
        for (NSInteger idx = 1; idx < self.MAPositions.count ; idx++)
        {
            CGPoint point = [self.MAPositions[idx] CGPointValue];
            CGContextAddLineToPoint(self.context, point.x, point.y);
            //
            //
            //        //日期
            //        NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.kLineModel.Date.doubleValue/1000];
            //        NSDateFormatter *formatter = [NSDateFormatter new];
            //        formatter.dateFormat = @"HH:mm";
            //        NSString *dateStr = [formatter stringFromDate:date];
            //
            //        CGPoint drawDatePoint = CGPointMake(point.x + 1, self.maxY + 1.5);
            //        if(CGPointEqualToPoint(self.lastDrawDatePoint, CGPointZero) || point.x - self.lastDrawDatePoint.x > 60 )
            //        {
            //            [dateStr drawAtPoint:drawDatePoint withAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:11],NSForegroundColorAttributeName : [UIColor assistTextColor]}];
            //            self.lastDrawDatePoint = drawDatePoint;
            //        }
        }
        //
        
        
    }
    
    CGContextStrokePath(self.context);
}
@end
