//
//  JTLabelScaleViewController.m
//  JTAnimations
//
//  Created by BJT on 17/8/30.
//  Copyright © 2017年 BJT. All rights reserved.
//  参考自: https://github.com/YouXianMing
//

#import "JTLabelScaleViewController.h"
#import "JTScaleLabel.h"

#import "JTConst.h"
#import "UIView+Frame.h"

@interface JTLabelScaleViewController ()

@end

@implementation JTLabelScaleViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.9];
    [self.navView setTitle:self.title WithColor:nil];
    
    [self setupLabel];
}

-(void)setupLabel{
    
    {
        JTScaleLabel *label      = [[JTScaleLabel alloc] initWithFrame:CGRectMake(0, 0, kScreenSzie.width, 100)];
        label.text             = @"オモシロイ";
        label.startScale       = 0.5f;  // 初始大小
        label.endScale         = 2.f;  // 动画 label 结束时的 scale
        label.backedLabelColor = [UIColor whiteColor];
        label.colorLabelColor  = [UIColor cyanColor];
        label.font             = [UIFont fontWithName:@"Avenir-Light" size:40];
        label.center           = self.contentView.middlePoint;
        label.centerY         -= 100;
        [self.contentView addSubview:label];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [label startAnimation];
            
        });
    }
}



@end
