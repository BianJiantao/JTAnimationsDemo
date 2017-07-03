//
//  JTConst.h
//  JTAnimations
//
//  Created by BJT on 17/7/1.
//  Copyright © 2017年 BJT. All rights reserved.
//

#import <UIKit/UIKit.h>


#define kJTColorWithRGB( r , g , b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define kJTColorRandom kJTColorWithRGB(arc4random_uniform(256) , arc4random_uniform(256) , arc4random_uniform(256) )

#define kScreenSzie [[UIScreen mainScreen] bounds].size

#define  JTNotificationCenter  [NSNotificationCenter defaultCenter]

/** 启动动画结束的通知 */
extern NSString *const LaunchAnimationDidEndNotification;