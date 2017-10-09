//
//  JTMusicFrequencyController.m
//  JTAnimations
//
//  Created by BJT on 17/8/28.
//  Copyright © 2017年 BJT. All rights reserved.
//

#import "JTMusicFrequencyController.h"
#import "JTConst.h"

@interface JTMusicFrequencyController ()

@property (nonatomic,strong) NSTimer *timer;

@end

@implementation JTMusicFrequencyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =  kJTColorWithRGB(25, 25, 25);//[[UIColor blackColor] colorWithAlphaComponent:0.9];
    [self.navView setTitle:self.title WithColor:nil];
    
    [self setupMusicAni];
    
}

-(void)setupMusicAni{
    
    CGFloat width  = self.contentView.frame.size.width;
    CGFloat height = self.contentView.frame.size.height;
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    [self.contentView.layer addSublayer:replicatorLayer];
    replicatorLayer.frame              = CGRectMake(0, 0, width, height);
    replicatorLayer.instanceCount      = width / 8;
    replicatorLayer.masksToBounds      = YES;
    replicatorLayer.instanceTransform  = CATransform3DMakeTranslation(-8.0, 0.0, 0.0);
    replicatorLayer.instanceDelay      = 0.5; // 设置复制图层的延时,达到频谱不同步的效果
    
    // 要复制图层的对象 , 跳动的彩色条块
    CALayer *layer        = [CALayer layer];
    layer.frame           = CGRectMake(width - 4, height, 4, height);
    layer.backgroundColor = [UIColor blackColor].CGColor;
    layer.cornerRadius    = 2.f;
    [replicatorLayer addSublayer:layer];
    
    // 持续执行动画
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(addAnimToLayer:) userInfo:layer repeats:YES];

    
}

-(void)addAnimToLayer:(NSTimer *)timer{
    
    CALayer *layer = (CALayer *)timer.userInfo;
    CABasicAnimation *colorAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    colorAnimation.toValue           = (id)kJTColorRandom.CGColor;
    
    CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];

    NSValue *toValue = @(layer.position.y - arc4random_uniform((u_int32_t)layer.frame.size.height));
    
//    NSLog(@"toValue: %@",toValue);
//    NSLog(@"%@----%@",NSStringFromCGPoint(layer.position),NSStringFromCGRect(layer.bounds));
    
    positionAnimation.toValue        = toValue;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration          = 1.f;
    group.autoreverses      = true;
    group.repeatCount       = 20;
    group.timingFunction    = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    group.animations        = @[colorAnimation, positionAnimation];
    [layer addAnimation:group forKey:nil];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.timer invalidate];
    self.timer = nil;
    
}


@end
