//
//  YFHeader.h
//  tourongzhuanjia
//
//  Created by 李永方 on 16/1/18.
//  Copyright © 2016年 JWZhang. All rights reserved.
//

#ifndef YFHeader_h
#define YFHeader_h

#define KMainViewBackgroundColor [UIColor colorWithRed:240.0/255.0 green:238.0/255.0 blue:246.0/255.0 alpha:1]
#define IOS9 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)
#define KScreenWidth [[UIScreen mainScreen] bounds].size.width
#define KScreenHeight [[UIScreen mainScreen] bounds].size.height
#define AutoSizeScaleX (KScreenHeight > 480 ? KScreenWidth/320 : 1.0)
#define AutoSizeScaleY (KScreenHeight > 480 ? KScreenHeight/568 : 1.0)
#define CGRectMakeCustom(x, y, width, height) CGRectMake(x * AutoSizeScaleX, y * AutoSizeScaleY, width * AutoSizeScaleX, height * AutoSizeScaleY)
#define CGSizeMakeCustom(width,height)  CGSizeMake(width * AutoSizeScaleX,height * AutoSizeScaleY)
#define Font(s) (IOS9 ? [UIFont systemFontOfSize:s] : [UIFont fontWithName:@"STHeitiSC-Light" size:s]) // San Francisco
#define ColorI(c) [UIColor colorWithRed:((c>>16)&0xff)/255.0 green:((c>>8)&0xff)/255.0 blue:(c&0xff)/255.0 alpha:1.0] // ColorI(0xbfbfbf)
// 4inch的间距
#define LENGTH_4INCH_ADAPTED(l) l
#define DIDSELECTEDHISTORYCELL  @"DIDSELECTEDHISTORYCELL"
#define DIDSELECTHOTSEARCHCELL  @"DIDSELECTHOTSEARCHCELL"

#endif /* YFHeader_h */
