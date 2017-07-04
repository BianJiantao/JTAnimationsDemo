//
//  JTNavView.h
//  JTAnimations
//
//  Created by BJT on 17/7/3.
//  Copyright © 2017年 BJT. All rights reserved.
// 导航栏 view

#import <UIKit/UIKit.h>

@interface JTNavView : UIView

+(instancetype)navViewWithTarget:(id)target Action:(SEL)action;

-(void)setBackBtnImage:(NSString *)normal highImage:(NSString *)highImage;
-(void)setTitle:(NSString *)title WithColor:(UIColor *)titleColor;
/** 插入 subview 在返回按钮的下面,避免拦截掉返回按钮的点击 */
-(void)insertSubviewBelowBackBtn:(UIView *)view;

@end
