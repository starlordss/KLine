//
//  SZKLineGlobalVariable.h
//  KLineDemo
//
//  Created by chaobi on 2018/1/24.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SZKLineConstant.h"
@interface SZKLineGlobalVariable : NSObject
/**
 *  K线图的宽度，默认20
 */
+(CGFloat)kLineWidth;

+(void)setkLineWith:(CGFloat)kLineWidth;

/**
 *  K线图的间隔，默认1
 */
+(CGFloat)kLineGap;

+(void)setkLineGap:(CGFloat)kLineGap;

/**
 *  MainView的高度占比,默认为0.5
 */
+ (CGFloat)kLineMainViewRadio;
+ (void)setkLineMainViewRadio:(CGFloat)radio;

/**
 *  VolumeView的高度占比,默认为0.2
 */
+ (CGFloat)kLineVolumeViewRadio;
+ (void)setkLineVolumeViewRadio:(CGFloat)radio;


/**
 *  isEMA线
 */
+ (CGFloat)isEMALine;
+ (void)setisEMALine:(SZKLineTargetLineStatus)type;



/**
 *  isBOLL线
 */
+ (CGFloat)isBOLLLine;
+ (void)setisBOLLLine:(SZKLineTargetLineStatus)type;

@end
