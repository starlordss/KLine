//
//  SZKLineGlobalVariable.m
//  KLineDemo
//
//  Created by chaobi on 2018/1/24.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#import "SZKLineGlobalVariable.h"

/**
 *  K线图的宽度，默认20
 */
static CGFloat SZKLineWidth = 2;

/**
 *  K线图的间隔，默认1
 */
static CGFloat SZKLineGap = 1;


/**
 *  MainView的高度占比,默认为0.5
 */
static CGFloat SZKLineMainViewRadio = 0.5;

/**
 *  VolumeView的高度占比,默认为0.5
 */
static CGFloat SZKLineVolumeViewRadio = 0.2;


/**
 *  是否为EMA线
 */
static SZKLineTargetLineStatus kLineIsEMALine = SZKLineTargetLineStatusMA;

/**
 *  是否为BOLL线
 */
static SZKLineTargetLineStatus kLineIsBOLLLine = SZKLineTargetLineStatusBOLL;


@implementation SZKLineGlobalVariable

/**
 *  K线图的宽度，默认20
 */
+(CGFloat)kLineWidth
{
    return SZKLineWidth;
}
+(void)setkLineWith:(CGFloat)kLineWidth
{
    if (kLineWidth > SZKLineMaxWidth) {
        kLineWidth = SZKLineMaxWidth;
    }else if (kLineWidth < SZKLineMinWidth){
        kLineWidth = SZKLineMinWidth;
    }
    SZKLineWidth = kLineWidth;
}


/**
 *  K线图的间隔，默认1
 */
+(CGFloat)kLineGap
{
    return SZKLineGap;
}

+(void)setkLineGap:(CGFloat)kLineGap
{
    SZKLineGap = kLineGap;
}

/**
 *  MainView的高度占比,默认为0.5
 */
+ (CGFloat)kLineMainViewRadio
{
    return SZKLineMainViewRadio;
}
+ (void)setkLineMainViewRadio:(CGFloat)radio
{
    SZKLineMainViewRadio = radio;
}

/**
 *  VolumeView的高度占比,默认为0.2
 */
+ (CGFloat)kLineVolumeViewRadio
{
    return SZKLineVolumeViewRadio;
}
+ (void)setkLineVolumeViewRadio:(CGFloat)radio
{
    SZKLineVolumeViewRadio = radio;
}


/**
 *  isEMA线
 */

+ (CGFloat)isEMALine
{
    return kLineIsEMALine;
}
+ (void)setisEMALine:(SZKLineTargetLineStatus)type
{
    kLineIsEMALine = type;
}

/**
 *  isBOLL线
 */
+ (CGFloat)isBOLLLine {
    return kLineIsBOLLLine;
}
+ (void)setisBOLLLine:(SZKLineTargetLineStatus)type{
    kLineIsBOLLLine = type;
}


@end
