//
//  JTScaleLabel.h
//  JTAnimations
//
//  Created by BJT on 17/8/30.
//  Copyright © 2017年 BJT. All rights reserved.
//  参考自: https://github.com/YouXianMing
//
// 利用两个 label 实现缩放的动画,一个 label 用于实现 scale 动画
//

#import <UIKit/UIKit.h>

@interface JTScaleLabel : UIView

/**
 *  Label's text.
 */
@property (nonatomic, strong) NSString *text;

/**
 *  Label's color.
 */
@property (nonatomic, strong) UIFont   *font;

/**
 *  The Label's scale before the animation start.
 */
@property (nonatomic, assign) CGFloat   startScale;

/**
 *  The animated label's scale after the animation ended.
 */
@property (nonatomic, assign) CGFloat   endScale;

/**
 *  The show label's color.
 */
@property (nonatomic, strong) UIColor  *backedLabelColor;

/**
 *  The animated label's color.
 */
@property (nonatomic, strong) UIColor  *colorLabelColor;

/**
 *  Start animation.
 */
- (void)startAnimation;

@end
