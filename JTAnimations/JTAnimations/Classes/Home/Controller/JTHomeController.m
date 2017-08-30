//
//  JTHomeController.m
//  JTAnimations
//
//  Created by BJT on 17/7/1.
//  Copyright © 2017年 BJT. All rights reserved.
//

#import "FBShimmeringView.h"
#import "UIView+Frame.h"

#import "JTLabelScaleViewController.h"
#import "JTMusicFrequencyController.h"
#import "JTDecayViewController.h"
#import "JTPwdStrengthIndicatorViewController.h"
#import "JTPopNumberViewController.h"
#import "JTShimmerViewController.h"
#import "JTSnowViewController.h"
#import "JTHomeController.h"
#import "JTConst.h"
#import "JTHomeItem.h"

@interface JTHomeController () <UITableViewDelegate,UITableViewDataSource>
/** 数据 */
@property (nonatomic,strong) NSMutableArray *items;
/** 是否加载数据 */
@property (nonatomic,assign) BOOL loadData;
@property (nonatomic,weak) UITableView *tableView;
@end

@implementation JTHomeController

- (NSMutableArray *)items
{
    if (_items == nil) {
        _items = [[NSMutableArray alloc] init];
    }
    return _items;
}

-(void)dealloc
{
    [JTNotificationCenter removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    self.navView.alpha = 0;
    
    [self setupTitle];
    [self configData];
    [self setupTableView];
    
    // 监听启动动画结束, 加载 tableView 数据
    [JTNotificationCenter addObserver:self selector:@selector(setupAni) name:LaunchAnimationDidEndNotification object:nil];
}



-(void)setupTableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.contentView.bounds style:UITableViewStylePlain];
    tableView.delegate       = self;
    tableView.dataSource     = self;
    tableView.rowHeight      = 50.f;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:tableView];
    self.tableView = tableView;
    
}

-(void)setupAni
{
    self.loadData = YES;
    NSMutableArray *indexPaths = [NSMutableArray array];
    for (int i = 0; i < self.items.count; i++) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        [indexPaths addObject:indexPath];
    }
    
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
}

-(void)setupTitle
{
    FBShimmeringView *shimmeringView = [[FBShimmeringView alloc] initWithFrame:self.navView.bounds];
    [self.view addSubview:shimmeringView];
    
    shimmeringView.shimmering                  = YES;
    shimmeringView.shimmeringBeginFadeDuration = 0.3;
    shimmeringView.shimmeringOpacity           = 0.4;
    shimmeringView.shimmeringAnimationOpacity  = 1.0;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:shimmeringView.bounds];
    
//    NSMutableAttributedString *attrsText = [[NSMutableAttributedString alloc] initWithString:@"Animations"];
//    [attrsText addAttribute:NSForegroundColorAttributeName value:kJTColorWithRGB(50, 130, 200) range:NSMakeRange(1, 3)];
//    [attrsText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, attrsText.length)];
//    titleLabel.attributedText = attrsText;
    titleLabel.text = @"Animations";
    titleLabel.font = [UIFont fontWithName:@"Heiti SC" size:20];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor cyanColor];
    
    shimmeringView.contentView = titleLabel;
    
}

-(void)configData
{
    
    NSArray *array = @[
                       [JTHomeItem itemWithTitle:@"粒子动画-雪花" vcClass:[JTSnowViewController class]],
                       [JTHomeItem itemWithTitle:@"Facebook辉光动画" vcClass:[JTShimmerViewController class]],
                       [JTHomeItem itemWithTitle:@"Pop数值动画" vcClass:[JTPopNumberViewController class]],
                       [JTHomeItem itemWithTitle:@"密码强度指示动画" vcClass:[JTPwdStrengthIndicatorViewController class]],
                       [JTHomeItem itemWithTitle:@"衰减弹力动画" vcClass:[JTDecayViewController class]],
                       [JTHomeItem itemWithTitle:@"音乐频谱动画" vcClass:[JTMusicFrequencyController class]],
                       [JTHomeItem itemWithTitle:@"UILabel缩放动画" vcClass:[JTLabelScaleViewController class]]
                       
                       ];
    NSInteger count = array.count;
    for (int i = 0; i < count; i++) {
        JTHomeItem *item = array[i];
        
        NSString *title = [NSString stringWithFormat:@"%02d.  %@",i+1,item.title];
        NSMutableAttributedString *attrsText = [[NSMutableAttributedString alloc] initWithString:title];
        
        [attrsText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Heiti SC" size:16] range:NSMakeRange(0, attrsText.length)];
        [attrsText addAttribute:NSForegroundColorAttributeName value:kJTColorWithRGB(46, 201, 220) range:NSMakeRange(0, attrsText.length)];
        
        [attrsText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"GillSans-Italic" size:16] range:NSMakeRange(0, 3)];
        [attrsText addAttribute:NSForegroundColorAttributeName value:[[UIColor greenColor] colorWithAlphaComponent:0.8] range:NSMakeRange(0, 3)];
        item.attrsTitle = attrsText;
//        
//        if (i % 2 ) {
//            item.cellBgColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
//            
//        }else{
//            item.cellBgColor = [UIColor whiteColor];
//        }
        
        
    }
    [self.items addObjectsFromArray:array];
    
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return  self.loadData?self.items.count : 0;
//    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.detailTextLabel.font = [UIFont fontWithName:@"Avenir-Light" size:10];
        cell.detailTextLabel.textColor = [UIColor whiteColor];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.backgroundColor  = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    JTHomeItem *item = self.items[indexPath.row];

    
    cell.textLabel.attributedText = item.attrsTitle;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",item.vcClass];
    
    
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    JTHomeItem *item = self.items[indexPath.row];
    if (item.vcClass) {
        UIViewController *vc = [[item.vcClass alloc] init];
        [vc setTitle:item.title];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
