//
//  AppDelegate.m
//  JTAnimations
//
//  Created by BJT on 17/7/1.
//  Copyright © 2017年 BJT. All rights reserved.
//

#import "AppDelegate.h"
#import "JTNavigationController.h"
#import "JTHomeController.h"
#import "JTAppServiceTool.h"
#import "JTConst.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    JTHomeController*homeController       = [[JTHomeController alloc] init];
    JTNavigationController *navigationController = [[JTNavigationController alloc] initWithRootViewController:homeController];
    self.window.rootViewController = navigationController;
    self.window.backgroundColor    = [UIColor whiteColor];
//    homeController.view.hidden = YES;
    [self.window makeKeyAndVisible];
    
    // 启动动画
//    UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:self.window.bounds];
//    iconImageView.image        = [JTAppServiceTool launchImage];
//    [self.window addSubview:iconImageView];
//    [self.window bringSubviewToFront:iconImageView];
//    [UIView animateKeyframesWithDuration:1.5 delay:0.5 options:0 animations:^{
//        
//        iconImageView.transform = CGAffineTransformMakeScale(1.3, 1.3);
//        
//    } completion:^(BOOL finished) {
//        
//        [iconImageView removeFromSuperview];
//        
//        homeController.view.hidden = NO;
//    }];
//
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end
