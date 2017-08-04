//
//  JTPwdStrengthIndicatorView.h
//  JTAnimations
//
//  Created by BJT on 17/8/4.
//  Copyright © 2017年 BJT. All rights reserved.
//  密码强度指示view

#import <UIKit/UIKit.h>

/** 密码强度的状态 */
typedef NS_ENUM(NSInteger, PwdStrengthIndicatorViewStatus) {
    PwdStrengthIndicatorViewStatusNone,
    PwdStrengthIndicatorViewStatusWeak,
    PwdStrengthIndicatorViewStatusFair,
    PwdStrengthIndicatorViewStatusStrong
};

@interface JTPwdStrengthIndicatorView : UIView

@property(nonatomic) PwdStrengthIndicatorViewStatus status;

@end
