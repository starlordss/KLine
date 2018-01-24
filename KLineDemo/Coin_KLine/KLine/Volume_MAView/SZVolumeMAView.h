//
//  SZVolumeMAView.h
//  KLineDemo
//
//  Created by chaobi on 2018/1/24.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SZKLineModel;
@interface SZVolumeMAView : UIView

+(instancetype)view;

-(void)maProfileWithModel:(SZKLineModel *)model;

@end
