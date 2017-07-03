//
//  JTShimmerViewController.m
//  JTAnimations
//
//  Created by BJT on 17/7/3.
//  Copyright © 2017年 BJT. All rights reserved.
//

#import "FBShimmeringLayer.h"
#import "FBShimmeringView.h"

#import "UIBarButtonItem+Extension.h"
#import "JTShimmerViewController.h"

@interface JTShimmerViewController ()

@end

@implementation JTShimmerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    self.navigationController.navigationBar.subviews[0].alpha = 0.4;
   
    
    {
        FBShimmeringView *shimmeringView = [[FBShimmeringView alloc] initWithFrame:self.view.bounds];
        shimmeringView.shimmering = YES;
        shimmeringView.shimmeringBeginFadeDuration = 0.3;
        shimmeringView.shimmeringOpacity = 0.3;
        [self.view addSubview:shimmeringView];
        
        UILabel *logoLabel = [[UILabel alloc] initWithFrame:shimmeringView.bounds];
        logoLabel.text = @"Shimmer";
        logoLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:60.0];
        logoLabel.textColor = [UIColor whiteColor];
        logoLabel.textAlignment = NSTextAlignmentCenter;
        logoLabel.backgroundColor = [UIColor clearColor];
        shimmeringView.contentView = logoLabel;
    }
    
    {
        CGFloat lineWidth = 1;
        CGFloat radius = 130;
        FBShimmeringLayer *shimmeringLayer = [FBShimmeringLayer layer];
        shimmeringLayer.frame  = (CGRect){CGPointZero, CGSizeMake((radius + lineWidth) * 2, (radius + lineWidth) * 2)};
        shimmeringLayer.position = self.view.center;
        shimmeringLayer.shimmering = YES;
        shimmeringLayer.shimmeringBeginFadeDuration = 0.3;
        shimmeringLayer.shimmeringOpacity = 0.3;
        shimmeringLayer.shimmeringPauseDuration = 0.6f;
        [self.view.layer addSublayer:shimmeringLayer];
        
        CAShapeLayer *circleShape = [CAShapeLayer layer];
        
        circleShape.lineWidth   = lineWidth;
        circleShape.strokeColor =  [UIColor redColor].CGColor ;
        circleShape.fillColor   =  [UIColor clearColor].CGColor;
        
        circleShape.bounds   = CGRectMake(0, 0, (lineWidth + radius) * 2, (lineWidth + radius) * 2);
        circleShape.position = CGPointZero;
        UIBezierPath *path  = [UIBezierPath bezierPathWithArcCenter:CGPointMake(lineWidth + radius, lineWidth + 130)
                                                             radius:radius + lineWidth / 2.0
                                                         startAngle:0
                                                           endAngle:M_PI * 2
                                                          clockwise:NO];
        circleShape.path = path.CGPath;
        
        shimmeringLayer.contentLayer = circleShape;
    }

    
    
}



@end
