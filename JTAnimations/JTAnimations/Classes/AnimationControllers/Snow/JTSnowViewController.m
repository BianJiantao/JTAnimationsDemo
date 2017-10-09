//
//  JTSnowViewController.m
//  JTAnimations
//
//  Created by BJT on 17/7/2.
//  Copyright © 2017年 BJT. All rights reserved.
//

#import "UIView+Frame.h"

#import "JTSnowViewController.h"
#import "JTConst.h"
#import "JTNavigationController.h"

@interface JTSnowViewController ()

@property (nonatomic, strong) CALayer   *movedMask;

@end

@implementation JTSnowViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = kJTColorWithRGB(25, 25, 25);//[[UIColor blackColor] colorWithAlphaComponent:0.9];
    
    [self.navView setTitle:self.title WithColor:nil];
    
    // 创建粒子Layer
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    
    // 粒子发射位置
    snowEmitter.emitterPosition = CGPointMake(kScreenSzie.width*0.5,64);
    
    // 发射源的尺寸大小
    snowEmitter.emitterSize     = self.contentView.bounds.size;
    
    // 发射模式
    snowEmitter.emitterMode     = kCAEmitterLayerSurface;
    
    // 发射源的形状
    snowEmitter.emitterShape    = kCAEmitterLayerLine;
    
    // 创建雪花类型的粒子
    CAEmitterCell *snowflake    = [CAEmitterCell emitterCell];
    
    // 粒子的名字
    snowflake.name = @"snow";
    
    // 粒子参数的速度乘数因子
    snowflake.birthRate = 20.0;
    snowflake.lifetime  = 120.0;
    
    // 粒子速度
    snowflake.velocity  = 10.0;
    
    // 粒子的速度范围
    snowflake.velocityRange = 10;
    
    // 粒子y方向的加速度分量
    snowflake.yAcceleration = 2;
    
    // 周围发射角度
    snowflake.emissionRange = 0.5 * M_PI;
    
    // 粒子旋转角度范围
    snowflake.spinRange = 0.25 * M_PI;
    snowflake.contents  = (id)[[UIImage imageNamed:@"snow"] CGImage];
    
    // 设置雪花形状的粒子的颜色
    snowflake.color      = [[UIColor whiteColor] CGColor];
//    snowflake.redRange   = 2.f;
//    snowflake.greenRange = 2.f;
//    snowflake.blueRange  = 2.f;
    
    snowflake.scaleRange = 0.6f;
    snowflake.scale      = 0.7f;
    
    snowEmitter.shadowOpacity = 1.0;
    snowEmitter.shadowRadius  = 0.0;
    snowEmitter.shadowOffset  = CGSizeMake(0.0, 0.0);
    
    // 粒子边缘的颜色
    snowEmitter.shadowColor  = [[UIColor whiteColor] CGColor];
    
    // 添加粒子
    snowEmitter.emitterCells = @[snowflake];
    
    // 将粒子Layer添加进图层中
    [self.contentView.layer addSublayer:snowEmitter];
    
    // 形成遮罩
    UIImage *image      = [UIImage imageNamed:@"alpha"];
    _movedMask          = [CALayer layer];
    _movedMask.frame    = (CGRect){CGPointZero, image.size};
    _movedMask.contents = (__bridge id)(image.CGImage);
    _movedMask.position = CGPointMake(self.view.centerX, self.view.height*0.4);
    snowEmitter.mask    = _movedMask;
    
    // 拖拽的View
    UIView *dragView = [[UIView alloc] initWithFrame:(CGRect){CGPointZero, image.size}];
    dragView.center  = _movedMask.position;
    [self.contentView addSubview:dragView];
    
    // 给dragView添加拖拽手势
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(drag:)];
    [dragView addGestureRecognizer:recognizer];
    
    
}
- (void)drag:(UIPanGestureRecognizer *)recognizer {
    
    // 拖拽
    CGPoint translation    = [recognizer translationInView:self.contentView];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.contentView];
    
    // 关闭隐式动画
//    [CATransaction setDisableActions:YES];
    _movedMask.position = recognizer.view.center;
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
