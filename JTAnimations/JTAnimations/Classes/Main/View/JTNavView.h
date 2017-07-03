//
//  JTNavView.h
//  JTAnimations
//
//  Created by BJT on 17/7/3.
//  Copyright © 2017年 BJT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JTNavView : UIView

@property (nonatomic,assign) CGFloat backGroundAlpha;

+(instancetype)navViewWithTarget:(id)target Action:(SEL)action;

-(void)setBackBtnImage:(NSString *)normal highImage:(NSString *)highImage;
-(void)setTitle:(NSString *)title WithColor:(UIColor *)titleColor;


@end
