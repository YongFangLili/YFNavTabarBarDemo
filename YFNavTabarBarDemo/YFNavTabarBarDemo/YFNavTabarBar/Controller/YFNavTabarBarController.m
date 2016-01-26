//
//  YFNavTabarBarController.m
//  YFNavTabarBarDemo
//
//  Created by 李永方 on 16/1/25.
//  Copyright © 2016年 李永方. All rights reserved.
//

#import "YFNavTabarBarController.h"
#import "YFHeader.h"

@interface YFNavTabarBarController ()<UIGestureRecognizerDelegate,UIScrollViewDelegate>

/** 顶部标题 */
@property (nonatomic, strong) UIScrollView *titleScroolView;

/** 显示子控制器部分视图*/
@property (nonatomic, strong) UIScrollView*mainView;

/** 滑块 */
@property (nonatomic, strong) UIView *slipper;

@property (nonatomic, strong) NSArray *LablxArray;

//记录当前的 控制器
@property (nonatomic, strong) UIViewController *currentController;

// 当前的的索引
@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation YFNavTabarBarController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.titlesArray = @[@"标题1",@"标题2标题2标题2标题2标题2",@"标题3",@"标题4",@"标题5",@"标题6",@"标题7",@"标题8",@"标题9",];
    //初始化
    [self setUpbtns:self.titlesArray];
    
}

#pragma mark - 初始化 btns
-(void)setUpbtns:(NSArray *)titleArray {

    CGFloat buttonX = 0.0f;
    NSMutableArray *labelArray = [NSMutableArray array];
    //遍历数组
    for(int i = 0; i < titleArray.count;i++) {
        
        UILabel *label = [[UILabel alloc]init];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = titleArray[i];

        //设置 frame
        label.frame = CGRectMakeCustom(buttonX, 0, [self.itemsWidths[i] floatValue], 44.0f);
        label.layer.borderWidth = 1.0f;
        label.layer.borderColor = [UIColor yellowColor].CGColor;
        [self.titleScroolView addSubview:label];
        
        //绑定方法
        label.tag = 1000 + i;
        UITapGestureRecognizer *geture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickBtnToChangeController:)];
        [label addGestureRecognizer:geture];
//        geture.numberOfTapsRequired = 1;
        
        label.userInteractionEnabled = YES;
        
        [labelArray addObject:@(buttonX)];
        buttonX += [self.itemsWidths[i] floatValue];
    
    }
    

    self.LablxArray = labelArray;
    self.titleScroolView.contentSize = CGSizeMakeCustom(buttonX, 0);
    [self showLineWithButtonWidth:[self.itemsWidths[0] floatValue] withIndex:0];

}

-(void)dealloc {

    NSLog(@"我走了");
}


#pragma mark-响应按钮点击事件
-(void)clickBtnToChangeController:(UITapGestureRecognizer *)tap {

    //切换滑块
    NSInteger index = tap.view.tag - 1000;
    [self showLineWithButtonWidth:[self.itemsWidths[index] floatValue] withIndex:index];
    [self addPresentViewController:self.currentController WithIndex:index];
}

#pragma mark -改变 contenoffset


#pragma mark -切换控制器
-(void)addPresentViewController:(UIViewController *)VC WithIndex:(NSInteger)index{
    
    _currentController = VC;
    
    [self addChildViewController:self.subViewControllers[index]];
    [self.mainView addSubview:[self.subViewControllers[index] view]];
    [VC addChildViewController:self];
    [VC.view addSubview:self.view];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 自动获取大小
- (NSArray *)getButtonsWidthWithTitles:(NSArray *)titles;
{
    NSMutableArray *widths = [@[] mutableCopy];
    
    for (NSString *title in titles)
    {
        
       CGSize size =  [title boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
        
        NSNumber *width = [NSNumber numberWithFloat:size.width + 40.0f];
        
        [widths addObject:width];
    }
    
    return widths;
}
#pragma mark -滑块的显示
- (void)showLineWithButtonWidth:(CGFloat)width withIndex:(NSInteger)index;
{
    CGFloat labelX = [self.LablxArray[index] floatValue];
    [UIView animateWithDuration:0.3 animations:^{
        //改变 cotentoffset
        self.titleScroolView.contentOffset = CGPointMake(labelX, 0);

    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.1 animations:^{
            self.slipper.frame = CGRectMakeCustom(labelX, 40.0f, width, 3.0f);
        }];
        
    }];
    
    
   
}

#pragma mark -添加 mainView 的内容
-(void)setUpMainViewUI {
    
    for (int i = 0; i<self.subViewControllers.count; i++) {
        
        UIViewController *VC = self.subViewControllers[i];
        
        VC.view.frame = CGRectMake(i * KScreenWidth,0, KScreenWidth, _mainView.frame.size.height);
        
        [self.mainView addSubview:VC.view];
        
        [self addChildViewController:VC];
    }
    
}


#pragma mark -UIScrollviewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //设置当前的 index
    




}

#pragma mark - 懒加载
-(UIScrollView *)titleScroolView{
    
    if (!_titleScroolView) {
        
        _titleScroolView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,KScreenWidth , 44.0f * AutoSizeScaleY)];
        
        [self.view addSubview:_titleScroolView];
        _titleScroolView.delegate = self;
//        _titleScroolView.pagingEnabled = YES;
        _titleScroolView.backgroundColor = [UIColor cyanColor];
        _titleScroolView.userInteractionEnabled = YES;
        _titleScroolView.bounces = NO;
        _titleScroolView.showsVerticalScrollIndicator = NO;
    }
    return _titleScroolView;
}


-(NSArray *)itemsWidths {
    
    if (!_itemsWidths) {
        
        _itemsWidths = [self getButtonsWidthWithTitles:self.titlesArray];
    }
    
    return _itemsWidths;
}

-(NSArray *)titlesArray {

    if (!_titlesArray) {
        NSMutableArray *titleA = [NSMutableArray array];
        
        for (UIViewController *vc in self.subViewControllers) {
            
            [titleA addObject: vc.title];
        }
        _titlesArray = titleA;
    }
    return _titlesArray;
}


//滑块
-(UIView *)slipper{

    if (!_slipper) {
        CGFloat width = [self.itemsWidths[0] floatValue];
        _slipper = [[UIView alloc] initWithFrame:CGRectMakeCustom(0.0f, 40.0f, width, 3.0f)];
        _slipper.backgroundColor = UIColorWithRGBA(20.0f, 80.0f, 200.0f, 0.7f);
        [self.titleScroolView addSubview:_slipper];
    }
    return _slipper;
}

-(UIScrollView *)mainView {
    
    if(!_mainView){
        _mainView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0f, CGRectGetMaxY(self.titleScroolView.frame), KScreenWidth, KScreenHeight - CGRectGetMaxY(self.titleScroolView.frame))];
        _mainView.contentSize = CGSizeMakeCustom(self.subViewControllers.count * KScreenWidth, 0);
        _mainView.backgroundColor = [UIColor purpleColor];
        _mainView.delegate = self;
        [self.view addSubview:_mainView];
    }
    return _mainView;
}

@end
