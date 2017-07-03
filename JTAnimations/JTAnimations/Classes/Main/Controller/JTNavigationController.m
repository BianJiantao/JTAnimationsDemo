//
//  JTNavigationController.m
//  JTAnimations
//
//  Created by BJT on 17/7/1.
//  Copyright © 2017年 BJT. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "UIView+Frame.h"


#import "JTNavigationController.h"
#import "JTAppServiceTool.h"
#import "JTConst.h"

@interface JTNavigationController ()

@end

@implementation JTNavigationController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.subviews[0].alpha = 0;
    
//    UINavigationBar *bar = [UINavigationBar appearance];
//    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName:
//                                      [[UIColor blackColor] colorWithAlphaComponent:0.4] }];
    
    
    
    
    // 启动动画
    UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:(CGRect){CGPointZero,kScreenSzie}];
    iconImageView.image        = [JTAppServiceTool launchImage];
    [self.view addSubview:iconImageView];
    [self.view bringSubviewToFront:iconImageView];
    [UIView animateKeyframesWithDuration:1.5 delay:0.5 options:0 animations:^{
        
        iconImageView.transform = CGAffineTransformMakeScale(1.3, 1.3);
        iconImageView.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        [iconImageView removeFromSuperview];
        
        [JTNotificationCenter postNotificationName:LaunchAnimationDidEndNotification object:nil];
        
    }];
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSInteger count =self.viewControllers.count;
    if (count) {
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"backIcon" highlightedImage:@"backIcon_highlighted"];
        
        self.navigationBar.subviews[0].alpha = 1;
    }
    
    [super pushViewController:viewController animated:animated];
    
}


-(void)back
{
    self.navigationBar.subviews[0].alpha = 0;
    [self popViewControllerAnimated:YES];
}

-(UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    
    return [super popViewControllerAnimated:animated];
}


@end
