//
//  HYViewController.m
//  HYSlideMenu
//
//  Created by 华惠友 on 2018/5/25.
//  Copyright © 2018年 华惠友. All rights reserved.
//

#import "HYViewController.h"
#define kNotificationLeftSlide @"kNotificationLeftSlide"
@interface HYViewController ()

@end

@implementation HYViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:@"BarItemNormal3"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"BarItemSelected3"] forState:UIControlStateHighlighted];
    CGRect frame = button.frame;
    frame.size = button.currentImage.size;
    button.frame = frame;
    [button addTarget:self action:@selector(lefBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)lefBtnClick {
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationLeftSlide object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
