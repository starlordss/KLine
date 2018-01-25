//
//  SZKLineChartView.h
//  KLineDemo
//
//  Created by chaobi on 2018/1/25.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SZKLineConstant.h"

//种类
typedef NS_ENUM(NSInteger, SZKLineType) {
    SZKLineTypeTimeShare = 1,
    SZKLineType1Min,
    SZKLineType3MIn,
    SZKLineType5Min,
    SZKLineType10Min,
    SZKLineType15Min,
    SZKLineType30Min,
    SZKLineType1Hour,
    SZKLineType2Hour,
    SZKLineType4Hour,
    SZKLineType6Hour,
    SZKLineType12Hour,
    SZKLineType1Day,
    SZKLineType3Day,
    SZKLineType1Week
};


/**
 *  Y_StockChartView数据源
 */
@protocol SZKLineChartViewDataSource <NSObject>

-(id) kLineDatasWithIndex:(NSInteger)index;

@end

@interface SZKLineChartView : UIView

@property (nonatomic, strong) NSArray *itemModels;

/**
 *  数据源
 */
@property (nonatomic, weak) id<SZKLineChartViewDataSource> dataSource;

/**
 *  当前选中的索引
 */
@property (nonatomic, assign,readonly) SZKLineType currentLineTypeIndex;


-(void) reloadData;
@end

/************************ItemModel类************************/
@interface SZKLineChartViewItemModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) SZKLineCenterViewType centerViewType;

+ (instancetype)itemModelWithTitle:(NSString *)title type:(SZKLineCenterViewType)type;

@end
