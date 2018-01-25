//
//  SZKLineChartView.m
//  KLineDemo
//
//  Created by chaobi on 2018/1/25.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#import "SZKLineChartView.h"
#import "SZKLineView.h"
#import "SZKLineSegmentView.h"
#import "SZKLineGlobalVariable.h"
#import <Masonry.h>

@interface SZKLineChartView() <SZKLineSegmentViewDelegate>

/**
 *  K线图View
 */
@property (nonatomic, strong) SZKLineView *kLineView;

/**
 *  底部选择View
 */
@property (nonatomic, strong) SZKLineSegmentView *segmentView;

/**
 *  图表类型
 */
@property(nonatomic,assign) SZKLineCenterViewType currentCenterViewType;

/**
 *  当前索引
 */
@property(nonatomic,assign,readwrite) NSInteger currentIndex;
@end

@implementation SZKLineChartView

- (SZKLineView *)kLineView
{
    if(!_kLineView)
    {
        _kLineView = [SZKLineView new];
        [self addSubview:_kLineView];
        [_kLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.top.equalTo(self);
            make.bottom.equalTo(self.segmentView.mas_top);
        }];
    }
    return _kLineView;
}

- (SZKLineSegmentView *)segmentView
{
    if(!_segmentView)
    {
        _segmentView = [SZKLineSegmentView new];
        _segmentView.delegate = self;
        [self addSubview:_segmentView];
        [_segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.leading.trailing.equalTo(self);
            make.height.mas_equalTo(50);
        }];
    }
    return _segmentView;
}


- (void)setItemModels:(NSArray *)itemModels
{
    _itemModels = itemModels;
    if(itemModels)
    {
        NSMutableArray *items = [NSMutableArray array];
        for(SZKLineChartViewItemModel *item in itemModels)
        {
            [items addObject:item.title];
        }
        self.segmentView.items = items;
        SZKLineChartViewItemModel *firstModel = itemModels.firstObject;
        self.currentCenterViewType = firstModel.centerViewType;
    }
    if(self.dataSource)
    {
        self.segmentView.selectedIndex = 4;
    }
}

- (void)setDataSource:(id<SZKLineChartViewDataSource>)dataSource
{
    _dataSource = dataSource;
    if(self.itemModels)
    {
        self.segmentView.selectedIndex = 4;
    }
}
- (void)reloadData
{
    self.segmentView.selectedIndex = self.segmentView.selectedIndex;
}

#pragma mark - 代理方法

- (void)kLineSegmentView:(SZKLineSegmentView *)segmentView clickSegmentButtonIndex:(NSInteger)index
{
    self.currentIndex = index;
    
    if (index == 105) {
        
        [SZKLineGlobalVariable setisBOLLLine:SZKLineTargetLineStatusBOLL];
        self.kLineView.targetLineStatus = index;
        [self.kLineView reDraw];
        [self bringSubviewToFront:self.segmentView];
        
    } else  if(index >= 100 && index != 105) {
        
        [SZKLineGlobalVariable setisEMALine:index];
        self.kLineView.targetLineStatus = index;
        [self.kLineView reDraw];
        [self bringSubviewToFront:self.segmentView];
        
    } else {
        if(self.dataSource && [self.dataSource respondsToSelector:@selector(kLineDatasWithIndex:)])
        {
            id stockData = [self.dataSource kLineDatasWithIndex:index];
            
            if(!stockData)
            {
                return;
            }
            
            SZKLineChartViewItemModel *itemModel = self.itemModels[index];
            
            
            SZKLineCenterViewType type = itemModel.centerViewType;
            
            
            
            if(type != self.currentCenterViewType)
            {
                //移除当前View，设置新的View
                self.currentCenterViewType = type;
                switch (type) {
                    case SZKLineCenterViewTypeKline:
                    {
                        self.kLineView.hidden = NO;
                        //                    [self bringSubviewToFront:self.kLineView];
                        [self bringSubviewToFront:self.segmentView];
                        
                    }
                        break;
                        
                    default:
                        break;
                }
            }
            
            if(type == SZKLineCenterViewTypeOther)
            {
                
            } else {
                self.kLineView.kLineModels = (NSArray *)stockData;
                self.kLineView.MainViewType = type;
                [self.kLineView reDraw];
            }
            [self bringSubviewToFront:self.segmentView];
        }
    }
    
}
@end
/************************ItemModel类************************/
@implementation SZKLineChartViewItemModel

+ (instancetype)itemModelWithTitle:(NSString *)title type:(SZKLineCenterViewType)type
{
    SZKLineChartViewItemModel *itemModel = [SZKLineChartViewItemModel new];
    itemModel.title = title;
    itemModel.centerViewType = type;
    return itemModel;
}
@end
