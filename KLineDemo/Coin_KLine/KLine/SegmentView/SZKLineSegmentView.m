//
//  SZKLineSegmentView.m
//  KLineDemo
//
//  Created by chaobi on 2018/1/24.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#import "SZKLineSegmentView.h"
#import <Masonry.h>
#import "UIColor+SZKLine.h"
static NSInteger const SZKLineSegmentStartTag = 2000;

@interface SZKLineSegmentView()

@property (nonatomic, strong) UIButton *selectedBtn;

@property (nonatomic, strong) UIView *indicatorView;

@property (nonatomic, strong) UIButton *secondLevelSelectedBtn1;

@property (nonatomic, strong) UIButton *secondLevelSelectedBtn2;

@end

@implementation SZKLineSegmentView

#pragma mark - init
- (instancetype)initWithItems:(NSArray *)items {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.items = items;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor assistBackgroundColor];
    }
    return self;
}

#pragma mark - 指示器视图
- (UIView *)indicatorView {
    if (!_indicatorView) {
        _indicatorView = [UIView new];
        _indicatorView.backgroundColor = [UIColor assistBackgroundColor];
        NSArray *titleArr = @[@"MACD",@"KDJ",@"关闭",@"MA",@"EMA",@"BOLL",@"关闭"];
        __block UIButton *preBtn;
        [titleArr enumerateObjectsUsingBlock:^(NSString*  _Nonnull title, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton *btn = [UIButton new];
            [btn setTitleColor:[UIColor mainTextColor] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor ma30Color] forState:UIControlStateSelected];
            btn.titleLabel.font = [UIFont systemFontOfSize:13];
            btn.tag = SZKLineSegmentStartTag + 100 + idx;
            [btn addTarget:self action:@selector(event_segmentButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            [btn setTitle:title forState:UIControlStateNormal];
            [_indicatorView addSubview:btn];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.height.equalTo(_indicatorView);
                make.width.equalTo(_indicatorView).multipliedBy(1.0f/titleArr.count);
                make.left.equalTo(_indicatorView);
                if(preBtn)
                {
                    make.leading.equalTo(preBtn.mas_trailing);
                } else {
                    make.leading.equalTo(_indicatorView);
                }
            }];
            UIView *view = [UIView new];
            view.backgroundColor = [UIColor colorWithRed:52.f/255.f green:56.f/255.f blue:67/255.f alpha:1];
            [_indicatorView addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(btn);
                make.leading.equalTo(btn.mas_trailing);
                make.width.equalTo(@0.5);
            }];
            preBtn = btn;
        }];
    }
    return _indicatorView;
}
#pragma mark - 设置item
- (void)setItems:(NSArray *)items
{
    _items = items;
    if(items.count == 0 || !items)
    {
        return;
    }
    NSInteger index = 0;
    NSInteger count = items.count;
    UIButton *preBtn = nil;
    
    for (NSString *title in items)
    {
        UIButton *btn = [self private_createButtonWithTitle:title tag:SZKLineSegmentStartTag+index];
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor colorWithRed:52.f/255.f green:56.f/255.f blue:67/255.f alpha:1];
        [self addSubview:btn];
        [self addSubview:view];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left);
            make.height.equalTo(self).multipliedBy(1.0f/count);
            make.width.equalTo(self);
            if(preBtn)
            {
                make.leading.equalTo(preBtn.mas_trailing).offset(0.5);
            } else {
                make.leading.equalTo(self);
            }
        }];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(btn);
            make.leading.equalTo(btn.mas_trailing);
            make.width.equalTo(@0.5);
        }];
        preBtn = btn;
        index++;
    }
}

#pragma mark 设置底部按钮index
- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    _selectedIndex = selectedIndex;
    UIButton *btn = (UIButton *)[self viewWithTag:SZKLineSegmentStartTag + selectedIndex];
    NSAssert(btn, @"按钮初始化出错");
    [self event_segmentButtonClicked:btn];
}
- (void)setSelectedBtn:(UIButton *)selectedBtn
{
    if(_selectedBtn == selectedBtn)
    {
        if(selectedBtn.tag != SZKLineSegmentStartTag)
        {
            return;
        } else {
            
        }
    }
    
    if(selectedBtn.tag >= 2100 && selectedBtn.tag < 2103)
    {
        [_secondLevelSelectedBtn1 setSelected:NO];
        [selectedBtn setSelected:YES];
        _secondLevelSelectedBtn1 = selectedBtn;
        
    } else if(selectedBtn.tag >= 2103) {
        [_secondLevelSelectedBtn2 setSelected:NO];
        [selectedBtn setSelected:YES];
        _secondLevelSelectedBtn2 = selectedBtn;
    } else if(selectedBtn.tag != SZKLineSegmentStartTag){
        [_selectedBtn setSelected:NO];
        [selectedBtn setSelected:YES];
        _selectedBtn = selectedBtn;
    }
    
    _selectedIndex = selectedBtn.tag - SZKLineSegmentStartTag;
    
    if(_selectedIndex == 0 && self.indicatorView.frame.origin.x < 0)
    {
        [self.indicatorView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(self);
            make.left.equalTo(self);
            make.bottom.equalTo(self);
            make.width.equalTo(self);
        }];
        [UIView animateWithDuration:0.2f animations:^{
            [self layoutIfNeeded];
        }];
    } else {
        [self.indicatorView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(self);
            make.right.equalTo(self.mas_left);
            make.bottom.equalTo(self);
            make.width.equalTo(self);
        }];
        [UIView animateWithDuration:0.2f animations:^{
            [self layoutIfNeeded];
        }];
        
    }
    [self layoutIfNeeded];
}
#pragma mark - 私有方法
#pragma mark 创建底部按钮
- (UIButton *)private_createButtonWithTitle:(NSString *)title tag:(NSInteger)tag
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:[UIColor mainTextColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor ma30Color] forState:UIControlStateSelected];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    btn.tag = tag;
    [btn addTarget:self action:@selector(event_segmentButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:title forState:UIControlStateNormal];
    return btn;
}
#pragma mark 底部按钮点击事件
- (void)event_segmentButtonClicked:(UIButton *)btn
{
    self.selectedBtn = btn;
    
    if(btn.tag == SZKLineSegmentStartTag)
    {
        return;
    }
    if(self.delegate && [self.delegate respondsToSelector:@selector(kLineSegmentView:clickSegmentButtonIndex:)])
    {
        [self.delegate kLineSegmentView:self clickSegmentButtonIndex: btn.tag-SZKLineSegmentStartTag];
    }
}

@end
