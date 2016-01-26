//
//  YFNavTabarBarController.h
//  YFNavTabarBarDemo
//
//  Created by 李永方 on 16/1/25.
//  Copyright © 2016年 李永方. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFNavTabarBarController : UIViewController

/**子控制器数组*/
@property (nonatomic,strong) NSArray *subViewControllers;

/**标题数组数组*/
@property (nonatomic, strong) NSArray *titlesArray;

/**宽度数组*/
@property (nonatomic, strong) NSArray *itemsWidths;


//添加子视图的方法


@end
