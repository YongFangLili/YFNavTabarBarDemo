//
//  MainTabarController.m
//  YFNavTabarBarDemo
//
//  Created by 李永方 on 16/1/28.
//  Copyright © 2016年 李永方. All rights reserved.
//

#import "MainTabarController.h"
#import "ViewController.h"

@interface MainTabarController ()

@end

@implementation MainTabarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpChildViewControllers];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 初始化子控制器
-(void)setUpChildViewControllers{
    
    UITableViewController *NewsVc = [[UITableViewController alloc]init];
    NewsVc.view.backgroundColor = [UIColor purpleColor];
    NewsVc.title = @"资讯";
    UINavigationController *newsNav = [[UINavigationController alloc]initWithRootViewController:NewsVc];
    [self addChildViewController:newsNav];
    
    ViewController *SearchVc = [[ViewController alloc] init];
    SearchVc.view.backgroundColor = [UIColor yellowColor];
    SearchVc.title = @"搜索";
    UINavigationController *SearchNav = [[UINavigationController alloc]initWithRootViewController:SearchVc];
    [self addChildViewController:SearchNav];
    
    UIViewController *MineVc = [[UIViewController alloc] init];
    MineVc.view.backgroundColor = [UIColor magentaColor];
    MineVc.title = @"我";
    UINavigationController *MineNav = [[UINavigationController alloc]initWithRootViewController:MineVc];
    [self addChildViewController:MineNav];

}


//使用自定义的 tabar 创建按钮


@end
