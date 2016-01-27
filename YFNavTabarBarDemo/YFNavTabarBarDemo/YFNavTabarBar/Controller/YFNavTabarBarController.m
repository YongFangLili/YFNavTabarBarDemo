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
    self.currentIndex = 0;
    
    
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
    [self setUpMainViewUI];

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
#pragma mark -滑块、以及视图的切换
- (void)showLineWithButtonWidth:(CGFloat)width withIndex:(NSInteger)index;
{
    CGFloat labelX = [self.LablxArray[index] floatValue];
    // 获取右边下一个 labelX
    CGFloat labelNextX = (index == self.titlesArray.count - 1) ? self.titleScroolView.contentSize.width : [self.LablxArray[index + 1] floatValue];
    // 获取 labelx 对应的 label 的中心位置
    CGFloat labelCenterx = (labelNextX - labelX) / 2.0f + labelX;
    // 中心位置移动到屏幕的位置
    CGFloat offsetX = labelCenterx * AutoSizeScaleX - KScreenWidth / 2.0f;
    //当右侧移动到底的情况下
    offsetX = offsetX > self.titleScroolView.contentSize.width - KScreenWidth ? self.titleScroolView.contentSize.width - KScreenWidth : offsetX;
    //当左侧移动到底
    offsetX = offsetX < 0 ? 0 : offsetX;
    
    [UIView animateWithDuration:0.3 animations:^{
        //改变 cotentoffset
        self.titleScroolView.contentOffset = CGPointMake(offsetX, 0);

    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.1 animations:^{
            self.slipper.frame = CGRectMakeCustom(labelX, 40.0f, width, 3.0f);
        }];
        
    }];
    self.mainView.contentOffset = CGPointMake(index * KScreenWidth, 0);
    [self.mainView setContentOffset:CGPointMake(index * KScreenWidth, 0) animated:NO];
    
}

#pragma mark -添加 mainView 的内容
-(void)setUpMainViewUI:(NSInteger)index {
    
    
        UIViewController *VC = self.subViewControllers[index];
        
        VC.view.frame = CGRectMake(index * KScreenWidth,0, KScreenWidth, _mainView.frame.size.height);
        
        [self.mainView addSubview:VC.view];
        
        [self addChildViewController:VC];
    
}


#pragma mark - 初始化子控制器
-(void)setUpMainViewUI{
    
    for (int i = 0; i < self.subViewControllers.count; i++) {
        
        UIViewController *VC = self.subViewControllers[i];
        
        VC.view.frame = CGRectMake(i * KScreenWidth,0, KScreenWidth, _mainView.frame.size.height);
        
        [self.mainView addSubview:VC.view];
        
        [self addChildViewController:VC];
        
    }
    
}



#pragma mark -UIScrollviewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    //设置当前的 index
   NSInteger currentIndex = (scrollView.contentOffset.x + KScreenWidth / 2.0f) / KScreenWidth;
    NSLog(@"%ld",(long)currentIndex);
    
//    CGFloat X = (scrollView.contentOffset.x - currentIndex * KScreenWidth) + KScreenWidth / 2.0
//    self.mainView.contentOffset = CGPointMake(currentIndex * KScreenWidth, 0);
    
//    [self showLineWithButtonWidth:[self.itemsWidths[currentIndex] floatValue] withIndex:currentIndex];
    if (self.currentIndex != currentIndex) {
        self.currentIndex = currentIndex;
    }
    
    

}

//-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
//{
//    CGPoint offset = scrollView.contentOffset;
//    [_mainView setContentOffset:offset animated:NO];
//}


#pragma mark - 懒加载
-(UIScrollView *)titleScroolView{
    
    if (!_titleScroolView) {
        
        _titleScroolView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,64.0f ,KScreenWidth , 44.0f * AutoSizeScaleY)];
        
        [self.view addSubview:_titleScroolView];
//        _titleScroolView.delegate = self;
    
//        _titleScroolView.pagingEnabled = YES;
        _titleScroolView.backgroundColor = [UIColor cyanColor];
        _titleScroolView.userInteractionEnabled = YES;
        _titleScroolView.bounces = NO;
//        _titleScroolView.delegate = self;
        _titleScroolView.showsHorizontalScrollIndicator = NO;
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
        _mainView.contentSize = CGSizeMake(self.subViewControllers.count * KScreenWidth, 0);
        _mainView.backgroundColor = [UIColor purpleColor];
        _mainView.delegate = self;
        _mainView.bounces = NO;
        _mainView.pagingEnabled = YES;
        [self.view addSubview:_mainView];
    }
    return _mainView;
}

-(void)setCurrentIndex:(NSInteger)currentIndex {

    _currentIndex = currentIndex;
    
    [UIView animateWithDuration:0.1 animations:^{
        [self showLineWithButtonWidth:[self.itemsWidths[currentIndex] floatValue] withIndex:currentIndex];
    }];
    
   
}

@end
