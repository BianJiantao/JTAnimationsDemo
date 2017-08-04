//
//  JTPwdStrengthIndicatorView.m
//  JTAnimations
//
//  Created by BJT on 17/8/4.
//  Copyright © 2017年 BJT. All rights reserved.
//

#import "JTConst.h"

#import "JTPwdStrengthIndicatorView.h"

@interface JTPwdStrengthIndicatorView()
@property(nonatomic) UIView *indicatorView;
- (void)addIndicatorView;
- (void)animateIndicatorViewToStatus:(PwdStrengthIndicatorViewStatus)status;
- (CGFloat)multiplierForStatus:(PwdStrengthIndicatorViewStatus)status;
- (UIColor *)colorForStatus:(PwdStrengthIndicatorViewStatus)status;
@end

@implementation JTPwdStrengthIndicatorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.05];
        self.translatesAutoresizingMaskIntoConstraints = NO;
        self.layer.cornerRadius = 2.f;
        [self addIndicatorView];
    }
    return self;
}

#pragma mark - Property Setters

- (void)setStatus:(PwdStrengthIndicatorViewStatus)status
{
    if (status == _status) {
        return;
    }
    _status = status;
    [self animateIndicatorViewToStatus:status];
}

#pragma mark - Private Instance methods

- (void)animateIndicatorViewToStatus:(PwdStrengthIndicatorViewStatus)status
{
    [self.constraints enumerateObjectsUsingBlock:^(NSLayoutConstraint *constraint, NSUInteger idx, BOOL *stop) {
        if (constraint.firstAttribute == NSLayoutAttributeWidth) {
            *stop = YES;
            [self removeConstraint:constraint];
        }
    }];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.indicatorView
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:[self multiplierForStatus:status]
                                                      constant:0]];
    
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.7 options:0 animations:^{
        [self layoutIfNeeded];
        self.indicatorView.backgroundColor = [self colorForStatus:status];
    } completion:NULL];
}

- (CGFloat)multiplierForStatus:(PwdStrengthIndicatorViewStatus)status
{
    switch (status) {
        case PwdStrengthIndicatorViewStatusWeak:
            return 0.33f;
        case PwdStrengthIndicatorViewStatusFair:
            return 0.66f;
        case PwdStrengthIndicatorViewStatusStrong:
            return 1.f;
        default:
            return 0.f;
    }
}

- (UIColor *)colorForStatus:(PwdStrengthIndicatorViewStatus)status
{
    switch (status) {
        case PwdStrengthIndicatorViewStatusWeak:
            return kJTColorWithRGB(231, 76, 60); // 红色
        case PwdStrengthIndicatorViewStatusFair:
            return kJTColorWithRGB(241, 196, 15); // 黄色
        case PwdStrengthIndicatorViewStatusStrong:
            return kJTColorWithRGB(46, 204, 113); // 绿色
        default:
            return [UIColor whiteColor];
    }
}

- (void)addIndicatorView
{
    self.indicatorView = [UIView new];
    self.indicatorView.translatesAutoresizingMaskIntoConstraints = NO;
    self.indicatorView.layer.cornerRadius = self.layer.cornerRadius;
    [self addSubview:self.indicatorView];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.indicatorView
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:1.f
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.indicatorView
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:[self multiplierForStatus:self.status]
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.indicatorView
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.f
                                                      constant:0.f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.indicatorView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.f
                                                      constant:0.f]];
}

@end
