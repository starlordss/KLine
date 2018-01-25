//
//  ViewController.m
//  KLineDemo
//
//  Created by chaobi on 2018/1/24.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#import "ViewController.h"
#import "SZKLineSegmentView.h"
#import "SZKLineChartView.h"
#import "SZKLineGroupModel.h"
#import "UIColor+SZKLine.h"
#import "AppDelegate.h"
#import "NetWorking.h"
#import <Masonry.h>

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define SCREEN_MAX_LENGTH MAX(kScreenWidth,kScreenHeight)
#define IS_IPHONE_X (IS_IPHONE && SCREEN_MAX_LENGTH == 812.0)

@interface ViewController ()<SZKLineChartViewDataSource>

@property (nonatomic, strong) SZKLineChartView *kLineChartView;

@property (nonatomic, strong) SZKLineGroupModel *groupModel;

@property (nonatomic, copy) NSMutableDictionary <NSString*, SZKLineGroupModel*> *modelsDict;


@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, copy) NSString *type;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentIndex = -1;
    self.kLineChartView.backgroundColor = [UIColor backgroundColor];
}

- (NSMutableDictionary<NSString *,SZKLineGroupModel *> *)modelsDict {
    if (!_modelsDict) {
        _modelsDict = @{}.mutableCopy;
    }
    return _modelsDict;
}

- (id)kLineDatasWithIndex:(NSInteger)index {
    NSString *type;
    switch (index) {
        case 0:
        {
            type = @"1min";
        }
            break;
        case 1:
        {
            type = @"1min";
        }
            break;
        case 2:
        {
            type = @"1min";
        }
            break;
        case 3:
        {
            type = @"5min";
        }
            break;
        case 4:
        {
            type = @"30min";
        }
            break;
        case 5:
        {
            type = @"60min";
        }
            break;
        case 6:
        {
            type = @"1day";
        }
            break;
        case 7:
        {
            type = @"1week";
        }
            break;
            
        default:
            break;
    }
    self.currentIndex = index;
    self.type = type;
    if (!self.modelsDict[type]) {
        [self reloadData];
    } else {
        return self.modelsDict[type].models;
    }
    return nil;
    
}

- (void)reloadData
{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"period"] = self.type;
    param[@"symbol"] = @"btcusdt";
    param[@"size"] = @"300";
    
    [NetWorking requestWithApi:@"https://api.huobi.pro/market/history/kline" param:param thenSuccess:^(NSDictionary *responseObject) {
        if ([responseObject[@"status"] isEqualToString:@"ok"]) {
            SZKLineGroupModel *groupModel = [SZKLineGroupModel objectWithArray:responseObject[@"data"]];
            
            self.groupModel = groupModel;
            [self.modelsDict setObject:groupModel forKey:self.type];
            NSLog(@"%@",groupModel);
            [self.kLineChartView reloadData];
        }
        
    } fail:^{
        
    }];
}

- (SZKLineChartView *)kLineChartView {
    if (!_kLineChartView) {
        _kLineChartView = [SZKLineChartView new];
        _kLineChartView.itemModels = @[
                                       [SZKLineChartViewItemModel itemModelWithTitle:@"指标" type:SZKLineCenterViewTypeOther],
                                       [SZKLineChartViewItemModel itemModelWithTitle:@"分时" type:SZKLineCenterViewTypeTimeLine],
                                       [SZKLineChartViewItemModel itemModelWithTitle:@"1分" type:SZKLineCenterViewTypeKline],
                                       [SZKLineChartViewItemModel itemModelWithTitle:@"5分" type:SZKLineCenterViewTypeKline],
                                       [SZKLineChartViewItemModel itemModelWithTitle:@"30分" type:SZKLineCenterViewTypeKline],
                                       [SZKLineChartViewItemModel itemModelWithTitle:@"60分" type:SZKLineCenterViewTypeKline],
                                       [SZKLineChartViewItemModel itemModelWithTitle:@"日线" type:SZKLineCenterViewTypeKline],
                                       [SZKLineChartViewItemModel itemModelWithTitle:@"周线" type:SZKLineCenterViewTypeKline],
                                       ];
        _kLineChartView.dataSource = self;
        [self.view addSubview:_kLineChartView];
        [_kLineChartView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (IS_IPHONE_X) {
                make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 30, 0, 0));
            }else {
                make.edges.equalTo(self.view);
            }
        }];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
        tap.numberOfTapsRequired = 2;
        [self.view addGestureRecognizer:tap];
    }
    return _kLineChartView;
}

- (void)dismiss
{
//    AppDelegate *appdelegate = [UIApplication sharedApplication].delegate;
//    appdelegate.isEable = NO;
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
