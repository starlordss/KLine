//
//  SZKLineConstant.h
//  KLineDemo
//
//  Created by chaobi on 2018/1/24.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#ifndef SZKLineConstant_h
#define SZKLineConstant_h


/**
 *  K线图需要加载更多数据的通知
 */
#define SZKLineNeedLoadMoreDataNotification @"SZKLineNeedLoadMoreDataNotification"

/**
 *  K线图Y的View的宽度
 */
#define SZKLinePriceViewWidth 47

/**
 *  K线图的X的View的高度
 */
#define SZKLineTimeViewHeight 20

/**
 *  K线最大的宽度
 */
#define SZKLineMaxWidth 20

/**
 *  K线图最小的宽度
 */
#define SZKLineMinWidth 2

/**
 *  K线图缩放界限
 */
#define SZKLineScaleBound 0.03

/**
 *  K线的缩放因子
 */
#define SZKLineScaleFactor 0.03

/**
 *  UIScrollView的contentOffset属性
 */
#define SZKLineContentOffsetKey @"contentOffset"

/**
 *  时分线的宽度
 */
#define SZKLineTimeLineLineWidth 0.5

/**
 *  时分线图的Above上最小的X
 */
#define SZKLineTimeLineMainViewMinX 0.0

/**
 *  分时线的timeLabelView的高度
 */
#define SZKLineTimeLineTimeLabelViewHeight 19

/**
 *  时分线的成交量的线宽
 */
#define SZKLineTimeLineVolumeLineWidth 0.5

/**
 *  长按时的线的宽度
 */
#define SZKLineLongPressVerticalViewWidth 0.5

/**
 *  MA线的宽度
 */
#define SZKLineMALineWidth 0.8

/**
 *  上下影线宽度
 */
#define SZKLineShadowLineWidth 1
/**
 *  所有profileView的高度
 */
#define SZKLineProfileViewHeight 50

/**
 *  K线图上可画区域最小的Y
 */
#define SZKLineMainViewMinY 20

/**
 *  K线图上可画区域最大的Y
 */
#define SZKLineMainViewMaxY (self.frame.size.height - 15)

/**
 *  K线图的成交量上最小的Y
 */
#define SZKLineVolumeViewMinY 20

/**
 *  K线图的成交量最大的Y
 */
#define SZKLineVolumeViewMaxY (self.frame.size.height)

/**
 *  K线图的副图上最小的Y
 */
#define SZKLineAccessoryViewMinY 20

/**
 *  K线图的副图最大的Y
 */
#define SZKLineAccessoryViewMaxY (self.frame.size.height)

/**
 *  K线图的副图中间的Y
 */
//#define Y_StockChartKLineAccessoryViewMiddleY (self.frame.size.height-20)/2.f + 20
#define SZKLineAccessoryViewMiddleY (maxY - (0.f-minValue)/unitValue)

/**
 *  时分线图的Above上最小的Y
 */
#define SZKLineTimeLineMainViewMinY 0

/**
 *  时分线图的Above上最大的Y
 */
#define SZKLineTimeLineMainViewMaxY (self.frame.size.height-SZKLineTimeLineTimeLabelViewHeight)


/**
 *  时分线图的Above上最大的Y
 */
#define SZKLineTimeLineMainViewMaxX (self.frame.size.width)

/**
 *  时分线图的Below上最小的Y
 */
#define SZKLineTimeLineVolumeViewMinY 0

/**
 *  时分线图的Below上最大的Y
 */
#define SZKLineTimeLineVolumeViewMaxY (self.frame.size.height)

/**
 *  时分线图的Below最大的X
 */
#define SZKLineTimeLineVolumeViewMaxX (self.frame.size.width)

/**
 * 时分线图的Below最小的X
 */
#define SZKLineTimeLineVolumeViewMinX 0

//Kline种类
typedef NS_ENUM(NSInteger, SZKLineCenterViewType) {
    SZKLineCenterViewTypeKline= 1, //K线
    SZKLineCenterViewTypeTimeLine,  //分时图
    SZKLineCenterViewTypeOther
};


//Accessory指标种类
typedef NS_ENUM(NSInteger, SZKLineTargetLineStatus) {
    SZKLineTargetLineStatusMACD = 100,    //MACD线
    SZKLineTargetLineStatusKDJ,    //KDJ线
    SZKLineTargetLineStatusAccessoryClose,    //关闭Accessory线
    SZKLineTargetLineStatusMA , //MA线
    SZKLineTargetLineStatusEMA,  //EMA线
    SZKLineTargetLineStatusBOLL,  //BOLL线
    SZKLineTargetLineStatusCloseMA  //MA关闭线
    
};

#endif /* SZKLineConstant_h */
