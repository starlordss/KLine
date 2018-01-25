//
//  SZKLineMAView.h
//  KLineDemo
//
//  Created by Zahi on 2018/1/25.
//  Copyright © 2018年 Zahi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SZKLineModel;
@interface SZKLineMAView : UIView
+(instancetype)view;

-(void)maProfileWithModel:(SZKLineModel *)model;
@end
