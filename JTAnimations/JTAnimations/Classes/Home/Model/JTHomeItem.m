//
//  JTHomeItem.m
//  JTAnimations
//
//  Created by BJT on 17/7/2.
//  Copyright © 2017年 BJT. All rights reserved.
//

#import "JTHomeItem.h"

@implementation JTHomeItem

+(instancetype)itemWithTitle:(NSString *)title vcClass:(Class)vcClass
{
    JTHomeItem *item = [[JTHomeItem alloc] init];
    item.title  = title;
    item.vcClass = vcClass;
    return item;
}

@end
