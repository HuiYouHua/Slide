//
//  HYMainController.m
//  HYSlideMenu
//
//  Created by 华惠友 on 2018/5/25.
//  Copyright © 2018年 华惠友. All rights reserved.
//

#import "HYMainController.h"
#import "HYTabBarController.h"
#import "HYLeftViewController.h"
#import "UIView+Extensions.h"

#import "HYNavgationController.h"
#import "HYOtherController.h"

#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kOffsetWidth [UIScreen mainScreen].bounds.size.width*0.7
#define kOffsetBtnTag 1000

#define kNotificationLeftSlide @"kNotificationLeftSlide"

@interface HYMainController ()<HYLeftViewControllerDelegate>

@property (nonatomic, strong) HYLeftViewController *leftViewController;
@property (nonatomic, strong) HYTabBarController *mainViewController;

@end

@implementation HYMainController

- (instancetype)initWithLeftViewController:(UIViewController *)leftViewController mainViewController:(UIViewController *)mainViewController {
    if ([super init]) {
        [self setUpLeftVc:leftViewController];
        [self setUpMainVc:mainViewController];
        [self setUpOffsetBtn];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(resetMainFrameHandle:)];
    [self.view addGestureRecognizer:pan];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(slideNotification) name:kNotificationLeftSlide object:nil];
}

/* 设置左边视图位置 */
- (void)setUpLeftVc:(UIViewController *)leftViewController {
    _leftViewController = (HYLeftViewController *)leftViewController;
    
    _leftViewController.view.frame = CGRectMake(0, 0, kOffsetWidth, kScreenHeight);
    _leftViewController.delegate = self;
    [self addChildViewController:leftViewController];
    [self.view addSubview:leftViewController.view];
}

/* 设置主视图位置 */
- (void)setUpMainVc:(UIViewController *)mainViewController {
    _mainViewController = (HYTabBarController *)mainViewController;
    
    mainViewController.view.frame = CGRectMake(kOffsetWidth, 0, kScreenWidth, kScreenHeight);
    [self addChildViewController:mainViewController];
    [self.view addSubview:mainViewController.view];
}

/* 设置主视图隐藏按钮 */
- (void)setUpOffsetBtn {
    UIButton *offsetBtn = [self.mainViewController.view viewWithTag:kOffsetBtnTag];
    if (!offsetBtn) {
        offsetBtn = [[UIButton alloc] initWithFrame:self.mainViewController.view.bounds];
        offsetBtn.tag = kOffsetBtnTag;
        [offsetBtn addTarget:self action:@selector(offsetBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.mainViewController.view addSubview:offsetBtn];
    }
}

/* 根据偏移量重置视图位置 */
- (void)resetMainFrameHandle:(UIPanGestureRecognizer *)pan {
    UIView *leftView = self.leftViewController.view;
    UIView *mainView = self.mainViewController.view;
    
    CGPoint point = [pan translationInView:self.view];
    [pan setTranslation:CGPointZero inView:self.view];
    
    leftView.x += point.x;
    mainView.x += point.x;
    
    if (mainView.x <=0) {
        leftView.x = -kOffsetWidth;
        mainView.x = 0;
    }
    
    if (leftView.x>=0) {
        leftView.x = 0;
        mainView.x = kOffsetWidth;
    }
    if (pan.state == UIGestureRecognizerStateEnded) {
        if (mainView.x>= kOffsetWidth/2.0) {
            // 偏移量大于一半
            [self slideNotification];
            
        } else {
            UIButton *offsetBtn = [self.mainViewController.view viewWithTag:kOffsetBtnTag];
            [self offsetBtnClick:offsetBtn];
        }
    }
}

/* 侧滑通知 */
- (void)slideNotification {
    [UIView animateWithDuration:0.2 animations:^{
        self.leftViewController.view.x = 0;
        self.mainViewController.view.x = kOffsetWidth;
    }];
    
    [self setUpOffsetBtn];
}

- (void)offsetBtnClick:(UIButton *)btn {
    // 界面只呈现主视图 同时移除按钮
    [UIView animateWithDuration:0.2 animations:^{
        self.leftViewController.view.x = -kOffsetWidth;
        self.mainViewController.view.x = 0;
    } completion:^(BOOL finished) {
        [btn removeFromSuperview];
    }];
}


#pragma mark - HYLeftViewControllerDelegate

- (void)didSelectRow:(NSInteger)row title:(NSString *)title {
    UIButton *offsetBtn = [self.mainViewController.view viewWithTag:kOffsetBtnTag];
    [self offsetBtnClick:offsetBtn];
    
    HYOtherController *vc = [HYOtherController new];
    vc.title = title;
    HYNavgationController *nav = self.mainViewController.selectedViewController;
    [nav popToRootViewControllerAnimated:NO];
    [nav pushViewController:vc animated:NO];
}

@end













