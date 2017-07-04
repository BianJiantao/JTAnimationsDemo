//
//  JTConst.h
//  JTAnimations
//
//  Created by BJT on 17/7/1.
//  Copyright © 2017年 BJT. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kJTColorWithRGBA( r , g , b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define kJTColorWithRGB( r , g , b) kJTColorWithRGBA( r , g , b, 1)
#define kJTColorRandom kJTColorWithRGB(arc4random_uniform(256) , arc4random_uniform(256) , arc4random_uniform(256) )

#define kScreenSzie [[UIScreen mainScreen] bounds].size

#define  JTNotificationCenter  [NSNotificationCenter defaultCenter]

/** 启动动画结束的通知 */
extern NSString *const LaunchAnimationDidEndNotification;

extern NSInteger navViewTag;