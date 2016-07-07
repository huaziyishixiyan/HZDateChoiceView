//
//  HZDateSelectView.h
//  HealthAppBoss
//
//  Created by 华子 on 16/5/31.
//  Copyright © 2016年 北京华信龙链科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HZDateSelectView : UIView

#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height

#define YMColor(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:a]

#define HZWhiteColor YMColor(251, 251, 251, 1)

#define HZBlackColor YMColor(67, 67, 67, 1)

#define HZBlueColor YMColor(26, 146, 237, 1)

/***  日期类型 */
@property (nonatomic , assign) NSInteger type;

@end
