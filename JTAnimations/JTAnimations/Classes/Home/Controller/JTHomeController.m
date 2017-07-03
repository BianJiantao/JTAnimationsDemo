//
//  JTHomeController.m
//  JTAnimations
//
//  Created by BJT on 17/7/1.
//  Copyright © 2017年 BJT. All rights reserved.
//

#import "FBShimmeringView.h"
#import "UIView+Frame.h"

#import "JTShimmerViewController.h"
#import "JTSnowViewController.h"
#import "JTHomeController.h"
#import "JTConst.h"
#import "JTHomeItem.h"

@interface JTHomeController ()
/** 数据 */
@property (nonatomic,strong) NSMutableArray *items;
@property (nonatomic,assign) BOOL loadData;
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
    
    self.tableView.rowHeight      = 50.f;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    [self setupTitle];
    [self configData];
    
    // 监听启动动画结束, 加载 tableView 数据
    [JTNotificationCenter addObserver:self selector:@selector(setupAni) name:LaunchAnimationDidEndNotification object:nil];
    
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
    FBShimmeringView *shimmeringView = [[FBShimmeringView alloc] init];
    [self.view addSubview:shimmeringView];
    shimmeringView.width = kScreenSzie.width;
    shimmeringView.height = 44;
    shimmeringView.x = 0;
    shimmeringView.y = -shimmeringView.height-10;
    
    shimmeringView.shimmering                  = YES;
    shimmeringView.shimmeringBeginFadeDuration = 0.3;
    shimmeringView.shimmeringOpacity           = 0.2;
    shimmeringView.shimmeringAnimationOpacity  = 1.f;
    
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
    
    NSArray *array = @[[JTHomeItem itemWithTitle:@"粒子动画-雪花" vcClass:[JTSnowViewController class]],
                       [JTHomeItem itemWithTitle:@"辉光动画" vcClass:[JTShimmerViewController class]]
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
-(BOOL)prefersStatusBarHidden
{
    return YES;
}


@end
