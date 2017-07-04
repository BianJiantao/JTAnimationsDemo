//
//  JTBaseViewController.h
//  JTAnimations
//
//  Created by BJT on 17/7/3.
//  Copyright © 2017年 BJT. All rights reserved.
// 基类控制器

#import <UIKit/UIKit.h>
#import "JTNavView.h"

@interface JTBaseViewController : UIViewController
/*** 导航 view */
@property (nonatomic,strong) JTNavView *navView;
/** 内容 view */
@property (nonatomic,strong) UIView *contentView;
/**背景 view */
@property (nonatomic,strong) UIView *backGroundView; 

@end
