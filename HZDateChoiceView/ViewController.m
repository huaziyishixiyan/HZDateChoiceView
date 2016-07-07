//
//  ViewController.m
//  HZDateChoiceView
//
//  Created by 华子 on 16/6/1.
//  Copyright © 2016年 华子. All rights reserved.
//

#import "ViewController.h"
#import "HZDateSelectView.h"
#import "UIView+Extension.h"
#import "UIImage+ChangeColor.h"

@interface ViewController ()

/***  时间加减选择器 */
@property (nonatomic , weak) HZDateSelectView *dateView;

/***  日期切换上一个按钮 */
@property (nonatomic , weak) UIButton *currentBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIView *dataSeletedView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, SCREENW, 40)];
    [self.view addSubview:dataSeletedView];
    for (int i = 0; i < 4; i ++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(i * SCREENW / 4 + 10, 10, SCREENW / 4 - 20, 26)];
        [dataSeletedView addSubview:btn];
        btn.tag = i ;
        btn.selected = NO;
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = btn.height * 0.5;
        [btn setBackgroundImage:[UIImage imageWithColor:HZWhiteColor] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageWithColor:HZBlueColor] forState:UIControlStateSelected];
        [btn setTitleColor:HZBlackColor forState:UIControlStateNormal];
        [btn setTitleColor:HZWhiteColor forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(dataBtn:) forControlEvents:UIControlEventTouchUpInside];
        if (btn.tag == 0) {
            self.currentBtn = btn;
            btn.selected = YES;
            [btn setTitle:@"今天" forState:UIControlStateNormal];
        } else if (btn.tag == 1) {
            [btn setTitle:@"本月" forState:UIControlStateNormal];
        } else if (btn.tag == 2) {
            [btn setTitle:@"本季度" forState:UIControlStateNormal];
        } else if (btn.tag == 3) {
            [btn setTitle:@"本年" forState:UIControlStateNormal];
        }
    }
    
    HZDateSelectView *dateView = [[HZDateSelectView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(dataSeletedView.frame), SCREENW, 50)];
    self.dateView = dateView;
    dateView.type = 0;
    [self.view addSubview:dateView];
}

#pragma mark - 时间选择按钮点击
- (void)dataBtn:(UIButton *)button{
    self.currentBtn.selected = NO;
    button.selected = YES;
    self.dateView.type = button.tag;
    [self.dateView layoutSubviews];
    self.currentBtn = button;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
