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
    
    [self setupNavView];
}

-(void)setupNavView
{
    JTNavView *navView = [JTNavView navViewWithTarget:self Action:@selector(back)];
    
    [self.view addSubview:navView];
    self.navView = navView;
    
    UIView *contentView = [[UIView alloc] init];
    
    [self.view addSubview:contentView];
    contentView.x = 0;
    contentView.y = navView.height;
    contentView.width = kScreenSzie.width;
    contentView.height = kScreenSzie.height - navView.height;
    self.contentView = contentView;
    
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
