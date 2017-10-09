//
//  JTPopNumberViewController.m
//  JTAnimations
//
//  Created by BJT on 17/7/4.
//  Copyright © 2017年 BJT. All rights reserved.
//

#import "POP.h"
#import "UIView+Frame.h"

#import "JTConst.h"
#import "JTPopNumberViewController.h"

@interface JTPopNumberViewController ()

@property (nonatomic,weak) UILabel *label;

@property (nonatomic, strong) POPBasicAnimation  *numberAnimation;
@property (nonatomic,strong) CADisplayLink *timer;
@property (nonatomic,assign) CGFloat currentValue;

@end


static NSInteger const randomMax = 100;
static NSInteger const colorCoefficient = 255 / 100;

@implementation JTPopNumberViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navView setTitle:self.title WithColor:nil];
    
    self.view.backgroundColor =  kJTColorWithRGB(25, 25, 25);//[[UIColor blackColor] colorWithAlphaComponent:0.9];
    
    // Init label.
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    label.textAlignment = NSTextAlignmentCenter;
    label.center = CGPointMake(self.contentView.middleX, self.contentView.middleY-50);
    [self.contentView addSubview:label];
    self.label = label;
    
    // Init numberAnimation.
    self.numberAnimation = [POPBasicAnimation animation];
    
    
    // Timer event.
    CADisplayLink *timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateValue)];
    timer.frameInterval = 60*3; // 180帧,即3秒调用一次
    [timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    self.timer = timer;
    
//    [self updateValue];
    
}

-(void)updateValue
{
    // Start animation.
    [self configNumberAnimation];
    [self startAnimation];
}

-(void)configNumberAnimation
{
    self.numberAnimation.fromValue  = @(self.currentValue);
    self.numberAnimation.toValue = @(arc4random_uniform(randomMax + 1));
    self.numberAnimation.duration = 2;}
-(void)startAnimation
{
    // 将计算出来的值通过writeBlock动态给控件设定
    __weak typeof(self) weakSelf = self;
    self.numberAnimation.property = \
    [POPMutableAnimatableProperty propertyWithName:@"numberAnimation" initializer:^(POPMutableAnimatableProperty *prop) {
        
        prop.writeBlock = ^(id obj, const CGFloat values[]) {
            
            weakSelf.currentValue = values[0];
            [weakSelf POPNumberAnimationWithCurrentValue:values[0]];
        };
    }];
    
    // 添加动画
    [self pop_addAnimation:self.numberAnimation forKey:nil];
}

- (void)POPNumberAnimationWithCurrentValue:(CGFloat)currentValue
{
    // Init string.
    NSString *numberString = [NSString stringWithFormat:@"%.1f", currentValue];
    NSString *suffixString    = @"Perc";
    NSString *totalString  = [NSString stringWithFormat:@"%@ %@", numberString, suffixString];
    
    // Create richString.
    NSMutableAttributedString *richString = [[NSMutableAttributedString alloc] initWithString:totalString];
    
//    UIFont *font =[UIFont fontWithName:@"AppleGothic" size:30];
    NSDictionary *attr = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:@"HYQiHei-BEJF" size:30]};
    [richString addAttributes:attr range:NSMakeRange(0, totalString.length)];
    
    NSRange numstrRange = [totalString rangeOfString:numberString];
    [richString addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"HYQiHei-BEJF" size:60],          NSForegroundColorAttributeName:kJTColorWithRGBA((255-currentValue * colorCoefficient), 100*colorCoefficient, (255-currentValue * colorCoefficient), 0.8)}
                        range:numstrRange];
    
    NSRange suffixStrRange = [totalString rangeOfString:suffixString];
    [richString addAttributes:@{NSForegroundColorAttributeName:[[UIColor yellowColor] colorWithAlphaComponent:currentValue / 80] }
                        range:suffixStrRange];
    
    self.label.attributedText = richString;
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.timer invalidate];
    [super viewWillDisappear:animated];
}



@end
