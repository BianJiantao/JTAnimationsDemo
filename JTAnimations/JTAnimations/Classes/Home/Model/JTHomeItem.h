//
//  JTHomeItem.h
//  JTAnimations
//
//  Created by BJT on 17/7/2.
//  Copyright © 2017年 BJT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JTHomeItem : NSObject

/** 标题 */
@property (nonatomic,copy) NSString *title;
/** 要跳转的控制器的类型 */
@property (nonatomic,assign) Class vcClass;
/** cell 的背景色 */
@property (nonatomic,strong) UIColor *cellBgColor;
/** label title文本颜色 */
@property (nonatomic,strong) UIColor *titleColor;
/** label  detaill title文本颜色 */
@property (nonatomic,strong) UIColor *detailColor;

/** 富文本 */
@property (nonatomic,strong) NSAttributedString *attrsTitle;

+(instancetype)itemWithTitle:(NSString *)title vcClass:(Class)vcClass;


@end
