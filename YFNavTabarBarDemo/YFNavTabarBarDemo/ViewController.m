//
//  ViewController.m
//  YFNavTabarBarDemo
//
//  Created by 李永方 on 16/1/25.
//  Copyright © 2016年 李永方. All rights reserved.
//

#import "ViewController.h"
#import "YFNavTabarBarController.h"
#import "YFHeader.h"

@interface ViewController ()

@property(nonatomic , strong) YFNavTabarBarController *nav;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableViewController *oneViewController = [[UITableViewController alloc] init];
    oneViewController.title = @"新闻";
    UITextField *text1 = [[UITextField alloc]initWithFrame:CGRectMake(200, 200, 200, 200)];
    text1.text = oneViewController.title;
    [oneViewController.view addSubview:text1];
    oneViewController.view.backgroundColor = [UIColor brownColor];
    
    UIViewController *twoViewController = [[UIViewController alloc] init];
    twoViewController.title = @"体育";
    UITextField *text2 = [[UITextField alloc]initWithFrame:CGRectMake(200, 200, 200, 200)];
    text2.text = twoViewController.title;
    [twoViewController.view addSubview:text2];
    twoViewController.view.backgroundColor = [UIColor purpleColor];
    
    UIViewController *threeViewController = [[UIViewController alloc] init];
    threeViewController.title = @"娱乐八卦";
    UITextField *text3 = [[UITextField alloc]initWithFrame:CGRectMake(200, 200, 200, 200)];
    text3.text = threeViewController.title;
    [threeViewController.view addSubview:text3];

    threeViewController.view.backgroundColor = [UIColor orangeColor];
    
    UIViewController *fourViewController = [[UIViewController alloc] init];
    fourViewController.title = @"天府之国";
    UITextField *text4 = [[UITextField alloc]initWithFrame:CGRectMake(200, 200, 200, 200)];
    text4.text = fourViewController.title;
    [fourViewController.view addSubview:text4];
    fourViewController.view.backgroundColor = [UIColor magentaColor];
    
    UIViewController *fiveViewController = [[UIViewController alloc] init];
    fiveViewController.title = @"四川省";
    UITextField *text5 = [[UITextField alloc]initWithFrame:CGRectMake(200, 200, 200, 200)];
    text5.text = fiveViewController.title;
    [fiveViewController.view addSubview:text5];

    fiveViewController.view.backgroundColor = [UIColor yellowColor];
    
    UIViewController *sixViewController = [[UIViewController alloc] init];
    sixViewController.title = @"政治";
    UITextField *text6 = [[UITextField alloc]initWithFrame:CGRectMake(200, 200, 200, 200)];
    text6.text = sixViewController.title;
    [sixViewController.view addSubview:text6];

    sixViewController.view.backgroundColor = [UIColor cyanColor];
    
    UIViewController *sevenViewController = [[UIViewController alloc] init];
    sevenViewController.title = @"国际新闻";
    UITextField *text7 = [[UITextField alloc]initWithFrame:CGRectMake(200, 200, 200, 200)];
    text7.text = sevenViewController.title;
    [sevenViewController.view addSubview:text7];

    sevenViewController.view.backgroundColor = [UIColor blueColor];
    
    UIViewController *eightViewController = [[UIViewController alloc] init];
    eightViewController.title = @"自媒体";
    UITextField *text8 = [[UITextField alloc]initWithFrame:CGRectMake(200, 200, 200, 200)];
    text8.text = eightViewController.title;
    [eightViewController.view addSubview:text8];

    eightViewController.view.backgroundColor = [UIColor greenColor];
    
    UIViewController *ninghtViewController = [[UIViewController alloc] init];
    ninghtViewController.title = @"科技";
    UITextField *text9 = [[UITextField alloc]initWithFrame:CGRectMake(200, 200, 200, 200)];
    text9.text = ninghtViewController.title;
    [ninghtViewController.view addSubview:text9];

    ninghtViewController.view.backgroundColor = [UIColor redColor];
    YFNavTabarBarController *nav = [[YFNavTabarBarController alloc]init];
    self.nav = nav;
    nav.subViewControllers = @[oneViewController,twoViewController,threeViewController,fourViewController,fiveViewController,sixViewController,sevenViewController,eightViewController,ninghtViewController];
    self.view.backgroundColor = [UIColor redColor];
    [nav addPresentViewController:self WithIndex:0];
//    [self.view addSubview:nav.view];
    
    
   
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
