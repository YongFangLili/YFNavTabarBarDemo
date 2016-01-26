//
//  YFNavTabarBarController.m
//  YFNavTabarBarDemo
//
//  Created by 李永方 on 16/1/25.
//  Copyright © 2016年 李永方. All rights reserved.
//

#import "YFNavTabarBarController.h"
#import "YFHeader.h"

@interface YFNavTabarBarController ()<UIGestureRecognizerDelegate>

/** 顶部标题 */
@property (nonatomic, strong) UIScrollView *titleScroolView;

/** 滑块 */
@property (nonatomic, strong) UIView *slipper;

@property (nonatomic, strong) NSArray *LablxArray;


@end

@implementation YFNavTabarBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titlesArray = @[@"标题1",@"标题2",@"标题3",@"标题4",@"标题5",@"标题6",@"标题7",@"标题8",@"标题9",];
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
    self.titleScroolView.contentSize = CGSizeMakeCustom(buttonX, 44.0f);
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
//        CGSize size = [title sizeWithAttributes:<#(nullable NSDictionary<NSString *,id> *)#>]
//        CGSize size = [title sizeWithFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
        
       CGSize size =  [title boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
        
        NSNumber *width = [NSNumber numberWithFloat:size.width + 40.0f];
        
        [widths addObject:width];
    }
    
    return widths;
}
#pragma mark -滑块的显示
- (void)showLineWithButtonWidth:(CGFloat)width withIndex:(NSInteger)index;
{
    CGFloat labelX = [self.LablxArray[index] integerValue];
    self.slipper.frame = CGRectMakeCustom(labelX, 40.0f, width, 3.0f);
}


#pragma mark - 懒加载
-(UIScrollView *)titleScroolView{
    
    if (!_titleScroolView) {
        
        _titleScroolView = [[UIScrollView alloc]initWithFrame:CGRectMakeCustom(0, 0,KScreenWidth , 44.0f)];
        
        [self.view addSubview:_titleScroolView];
        
        _titleScroolView.backgroundColor = [UIColor cyanColor];
        _titleScroolView.userInteractionEnabled = YES;
    }
    return _titleScroolView;
}


-(NSArray *)itemsWidths {
    
    if (!_itemsWidths) {
        
        _itemsWidths = [self getButtonsWidthWithTitles:self.titlesArray];
    }
    
    return _itemsWidths;
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





@end
