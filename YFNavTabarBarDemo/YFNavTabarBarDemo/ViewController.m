//
//  ViewController.m
//  YFNavTabarBarDemo
//
//  Created by 李永方 on 16/1/25.
//  Copyright © 2016年 李永方. All rights reserved.
//

#import "ViewController.h"
#import "YFNavTabarBarController.h"

@interface ViewController ()

@property(nonatomic , strong) YFNavTabarBarController *nav;

@end

@implementation ViewController
-(void)clicklabel:(UITapGestureRecognizer *)tap{


}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//
//
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIViewController *oneViewController = [[UIViewController alloc] init];
    oneViewController.title = @"新闻";
    oneViewController.view.backgroundColor = [UIColor brownColor];
    
    UIViewController *twoViewController = [[UIViewController alloc] init];
    twoViewController.title = @"体育";
    twoViewController.view.backgroundColor = [UIColor purpleColor];
    
    UIViewController *threeViewController = [[UIViewController alloc] init];
    threeViewController.title = @"娱乐八卦";
    threeViewController.view.backgroundColor = [UIColor orangeColor];
    
    UIViewController *fourViewController = [[UIViewController alloc] init];
    fourViewController.title = @"天府之国";
    fourViewController.view.backgroundColor = [UIColor magentaColor];
    
    UIViewController *fiveViewController = [[UIViewController alloc] init];
    fiveViewController.title = @"四川省";
    fiveViewController.view.backgroundColor = [UIColor yellowColor];
    
    UIViewController *sixViewController = [[UIViewController alloc] init];
    sixViewController.title = @"政治";
    sixViewController.view.backgroundColor = [UIColor cyanColor];
    
    UIViewController *sevenViewController = [[UIViewController alloc] init];
    sevenViewController.title = @"国际新闻";
    sevenViewController.view.backgroundColor = [UIColor blueColor];
    
    UIViewController *eightViewController = [[UIViewController alloc] init];
    eightViewController.title = @"自媒体";
    eightViewController.view.backgroundColor = [UIColor greenColor];
    
    UIViewController *ninghtViewController = [[UIViewController alloc] init];
    ninghtViewController.title = @"科技";
    ninghtViewController.view.backgroundColor = [UIColor redColor];
    YFNavTabarBarController *nav = [[YFNavTabarBarController alloc]init];
    self.nav = nav;
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:nav.view];
    
    
    UILabel *la = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clicklabel:)];
    tap.numberOfTapsRequired = 1;
    [self.view addSubview:la];
    [la addGestureRecognizer:tap];
    la.userInteractionEnabled = YES;
    la.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
