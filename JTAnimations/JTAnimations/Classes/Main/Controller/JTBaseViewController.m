//
//  JTBaseViewController.m
//  JTAnimations
//
//  Created by BJT on 17/7/3.
//  Copyright © 2017年 BJT. All rights reserved.
//


#import "UIView+Frame.h"

#import "JTConst.h"
#import "JTBaseViewController.h"

@interface JTBaseViewController ()

@end

@implementation JTBaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViews];
    
    self.view.backgroundColor = [UIColor whiteColor]; // 避免 push 时出现黑色背景
}

-(void)setupViews
{
    UIView *backGroundView = [[UIView alloc] init];
    [self.view addSubview:backGroundView];
    backGroundView.frame = CGRectMake(0, 0, kScreenSzie.width, kScreenSzie.height);
    self.backGroundView = backGroundView;
    backGroundView.backgroundColor = [UIColor whiteColor];
    
    JTNavView *navView = [JTNavView navViewWithTarget:self Action:@selector(back)];
    [self.view addSubview:navView];
    self.navView = navView;
    navView.backgroundColor = [UIColor clearColor];
    
    UIView *contentView = [[UIView alloc] init];
    [self.view addSubview:contentView];
    contentView.x = 0;
    contentView.y = navView.height;
    contentView.width = kScreenSzie.width;
    contentView.height = kScreenSzie.height - navView.height;
    self.contentView = contentView;
    contentView.backgroundColor = [UIColor clearColor];
    
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
