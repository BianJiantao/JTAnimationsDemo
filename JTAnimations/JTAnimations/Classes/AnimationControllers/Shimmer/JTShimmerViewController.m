//
//  JTShimmerViewController.m
//  JTAnimations
//
//  Created by BJT on 17/7/3.
//  Copyright © 2017年 BJT. All rights reserved.
//

#import "FBShimmeringLayer.h"
#import "FBShimmeringView.h"
#import "UIView+Frame.h"

#import "UIBarButtonItem+Extension.h"
#import "JTShimmerViewController.h"

@interface JTShimmerViewController ()

@end

@implementation JTShimmerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    [self.navView setTitle:self.title WithColor:nil];
   
    
    {
        FBShimmeringView *shimmeringView = [[FBShimmeringView alloc] initWithFrame:self.contentView.bounds];
        shimmeringView.shimmering = YES;
        shimmeringView.shimmeringBeginFadeDuration = 0.3;
        shimmeringView.shimmeringOpacity = 0.3;
        [self.contentView addSubview:shimmeringView];
        shimmeringView.y -= 50;
        
        
        UILabel *logoLabel = [[UILabel alloc] initWithFrame:shimmeringView.bounds];
        logoLabel.text = @"Shimmer";
        logoLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:60.0];
        logoLabel.textColor = [UIColor whiteColor];
        logoLabel.textAlignment = NSTextAlignmentCenter;
        logoLabel.backgroundColor = [UIColor clearColor];
        shimmeringView.contentView = logoLabel;
    }
    
    {
        CGFloat lineWidth = 2; // 贝塞尔曲线宽度
        CGFloat radius = 130;  // 半径
        FBShimmeringLayer *shimmeringLayer = [FBShimmeringLayer layer];
        shimmeringLayer.frame  = (CGRect){{0,0}, CGSizeMake((radius + lineWidth) * 2, (radius + lineWidth) * 2)};
        
//        shimmeringLayer.position = [self.contentView.superview convertPoint:self.contentView.center toView:self.contentView];
        shimmeringLayer.position = CGPointMake(self.contentView.centerX, self.contentView.height*0.5-50);
        shimmeringLayer.shimmering = YES;
        shimmeringLayer.shimmeringBeginFadeDuration = 0.3;
        shimmeringLayer.shimmeringOpacity = 0.3;
        shimmeringLayer.shimmeringPauseDuration = 0.2f;
        [self.contentView.layer addSublayer:shimmeringLayer];
        
        CAShapeLayer *circleShape = [CAShapeLayer layer];
        
        circleShape.lineWidth   = lineWidth;
        circleShape.strokeColor =  [UIColor greenColor].CGColor ;
        circleShape.fillColor   =  [UIColor clearColor].CGColor;
        
        circleShape.frame = shimmeringLayer.bounds;
        
        UIBezierPath *path  = [UIBezierPath bezierPathWithArcCenter:
                               CGPointMake(lineWidth + radius, lineWidth + radius)
                                radius:radius + lineWidth / 2.0
                                startAngle:0
                                endAngle:M_PI * 2
                                clockwise:NO];
        circleShape.path = path.CGPath;
        
        shimmeringLayer.contentLayer = circleShape;
    }

    
    
}



@end
