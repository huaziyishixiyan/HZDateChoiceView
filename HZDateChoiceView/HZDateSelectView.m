//
//  HZDateSelectView.m
//  HealthAppBoss
//
//  Created by 华子 on 16/5/31.
//  Copyright © 2016年 北京华信龙链科技有限公司. All rights reserved.
//

#import "HZDateSelectView.h"
#import "UIView+Extension.h"

@interface HZDateSelectView ()
/***  显示日期 */
@property (nonatomic , weak)UILabel *dataLable;
/***  当前日期 */
@property (nonatomic , copy)NSDate *currentDate;

@end

@implementation HZDateSelectView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENW, 50)];
        [self addSubview:view];
        
        UILabel *datalable = [[UILabel alloc] init];
        datalable.size = CGSizeMake(120, view.height);
        datalable.y = 0;
        datalable.centerX = view.centerX;
        datalable.textColor = HZBlackColor;
        datalable.font = [UIFont systemFontOfSize:15];
        datalable.textAlignment = NSTextAlignmentCenter;
        self.dataLable = datalable;
        [view addSubview:datalable];
        
        UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMinX(datalable.frame) - 50, 0, 50, 50)];
        [leftBtn setImage:[UIImage imageNamed:@"home_data_left"] forState:UIControlStateNormal];
        [leftBtn setContentMode:UIViewContentModeCenter];
        [leftBtn addTarget:self action:@selector(leftBtn) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:leftBtn];
        
        UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(datalable.frame), 0, 50, 50)];
        [rightBtn setImage:[UIImage imageNamed:@"home_data_right"] forState:UIControlStateNormal];
        [rightBtn setContentMode:UIViewContentModeCenter];
        [rightBtn addTarget:self action:@selector(rightBtn) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:rightBtn];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    NSDate *nowDate = [NSDate date];
    self.currentDate = nowDate;
    if (self.type == 0) {
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        self.dataLable.text  = [NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:nowDate]];
    } else if (self.type == 1) {
        [dateFormatter setDateFormat:@"yyyy-MM"];
        self.dataLable.text  = [NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:nowDate]];
    } else if (self.type == 3) {
        [dateFormatter setDateFormat:@"yyyy年"];
        self.dataLable.text  = [NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:nowDate]];
    } else {
        [dateFormatter setDateFormat:@"yyyy-MM"];
        NSArray *dateArray = [[dateFormatter stringFromDate:nowDate] componentsSeparatedByString:@"-"];
        CGFloat i = [dateArray[1] floatValue] / 3;
        NSString *str = [NSString string];
        if (i <= 1) {
            str = @"一";
        } else if (i >1 && i <= 2) {
            str = @"二";
        } else if (i >2 && i <= 3) {
            str = @"三";
        } else {
            str = @"四";
        }
        self.dataLable.text  = [NSString stringWithFormat:@"%@年第%@季度", dateArray[0], str];
    }
}

- (void)leftBtn {
    if (self.type == 0) {
        self.dataLable.text = [self getDate:0 month:0 day:-1];
    } else if (self.type == 1) {
        self.dataLable.text = [self getDate:0 month:-1 day:0];
    } else if (self.type == 3) {
        self.dataLable.text = [self getDate:-1 month:0 day:0];
    } else {
        self.dataLable.text = [self getDate:0 month:-3 day:0];
    }
}

- (void)rightBtn {
    if (self.type == 0) {
        self.dataLable.text = [self getDate:0 month:0 day:1];
    } else if (self.type == 1) {
        self.dataLable.text = [self getDate:0 month:1 day:0];
    } else if (self.type == 3) {
        self.dataLable.text = [self getDate:1 month:0 day:0];
    } else {
        self.dataLable.text = [self getDate:0 month:3 day:0];
    }
}

- (NSString*)getDate:(int)year month:(int)month day:(int)day{
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *comps = nil;
    
    comps = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:[NSDate date]];
    
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    
    [adcomps setYear:year];
    
    [adcomps setMonth:month];
    
    [adcomps setDay:day];
    
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:self.currentDate options:0];
    
    self.currentDate = newdate;
    
    NSDateFormatter *formatter =  [[NSDateFormatter alloc] init];
    
    if (self.type == 0) {
        [formatter setDateFormat:@"yyyy-MM-dd"];
    } else if (self.type == 1) {
        [formatter setDateFormat:@"yyyy-MM"];
    } else if (self.type == 3) {
        [formatter setDateFormat:@"yyyy年"];
    } else {
        [formatter setDateFormat:@"yyyy-MM"];
    }
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/beijing"];
    
    [formatter setTimeZone:timeZone];
    
    NSString *dateFromData = [formatter stringFromDate:newdate];
    
    if (self.type == 2) {
        NSArray *dateArray = [dateFromData componentsSeparatedByString:@"-"];
        CGFloat i = [dateArray[1] floatValue] / 3;
        NSString *str = [NSString string];
        if (i <= 1) {
            str = @"一";
        } else if (i >1 && i <= 2) {
            str = @"二";
        } else if (i >2 && i <= 3) {
            str = @"三";
        } else {
            str = @"四";
        }
        dateFromData  = [NSString stringWithFormat:@"%@年第%@季度", dateArray[0], str];
    }
    
    return dateFromData;
    
}



@end
