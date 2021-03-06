//
//  ViewController.h
//  HZDateChoiceView
//
//  Created by 华子 on 16/6/1.
//  Copyright © 2016年 华子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
//屏幕的宽和高
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height

#define YMColor(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:a]

#define HZWhiteColor YMColor(251, 251, 251, 1)

#define HZBlackColor YMColor(67, 67, 67, 1)

#define HZBlueColor YMColor(26, 146, 237, 1)


@end

