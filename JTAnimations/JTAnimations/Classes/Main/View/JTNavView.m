//
//  JTNavView.m
//  JTAnimations
//
//  Created by BJT on 17/7/3.
//  Copyright © 2017年 BJT. All rights reserved.
//
#import "UIView+Frame.h"

#import "JTNavView.h"
#import "JTConst.h"

@interface JTNavView ()

@property (nonatomic,weak) UIButton *backBtn;
@property (nonatomic,weak) UILabel *titleLabel;

@end

@implementation JTNavView

-(instancetype)initWithTarget:(id)target action:(SEL)action
{
    self = [super init];
    if (self) {
        
        self.frame = CGRectMake(0, 0, kScreenSzie.width, 64);
        
        UIButton *btn = [[UIButton alloc] init];
        [btn setImage:[UIImage imageNamed:@"backIconVer2"] forState:UIControlStateNormal];
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        self.backBtn = btn;
        
        UILabel *titleLabel = [[UILabel alloc] init];
        self.titleLabel = titleLabel;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont fontWithName:@"Heiti SC" size:20];
        titleLabel.textColor = [kJTColorWithRGB(46, 201, 220) colorWithAlphaComponent:0.9];
        
        [self addSubview:titleLabel];
        [self addSubview:btn];
        self.userInteractionEnabled = YES;
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.backBtn.width = 40;
    self.backBtn.height = self.backBtn.width;
    self.backBtn.x = 10;
    self.backBtn.y = (self.height - self.backBtn.height) * 0.5;
    
    self.titleLabel.centerX = self.centerX;
    self.titleLabel.centerY = self.centerY;
    self.titleLabel.height = self.backBtn.height;
    self.titleLabel.width = 250;
    
    
}


-(void)insertSubviewBelowBackBtn:(UIView *)view
{
    [self insertSubview:view belowSubview:self.backBtn];
}

+(instancetype)navViewWithTarget:(id)target Action:(SEL)action
{
    return [[self alloc] initWithTarget:target action:action];
}

-(void)setBackBtnImage:(NSString *)normalImage highImage:(NSString *)highImage
{
    if (normalImage) {
        [self.backBtn setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    }
    if (highImage) {
        [self.backBtn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    }
}
-(void)setTitle:(NSString *)title WithColor:(UIColor *)titleColor
{
    self.titleLabel.text = title;
    if (titleColor) {
        self.titleLabel.textColor = titleColor;
    }
}


@end
