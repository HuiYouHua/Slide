//
//  HYTabBarController.m
//  HYSlideMenu
//
//  Created by 华惠友 on 2018/5/25.
//  Copyright © 2018年 华惠友. All rights reserved.
//

#import "HYTabBarController.h"
#import "HYNavgationController.h"
#import "HYViewController.h"

@interface HYTabBarController ()

@end

@implementation HYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    HYViewController *vc1 = [[HYViewController alloc] init];
    vc1.tabBarItem.image = [[UIImage imageNamed:@"BarItemNormal1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc1.tabBarItem.selectedImage = [[UIImage imageNamed:@"BarItemSelected1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc1.tabBarItem.title = @"首页";
    vc1.title = vc1.tabBarItem.title;
    [vc1.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:102.0/255 green:102.0/255 blue:102.0/255 alpha:1.0],NSForegroundColorAttributeName, [UIFont systemFontOfSize:10.0],NSFontAttributeName,nil] forState:UIControlStateNormal];
    [vc1.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor orangeColor],NSForegroundColorAttributeName, [UIFont systemFontOfSize:10.0],NSFontAttributeName,nil] forState:UIControlStateSelected];
    HYNavgationController *nav1 = [[HYNavgationController alloc] initWithRootViewController:vc1];
    
    
    HYViewController *vc2 = [[HYViewController alloc] init];
    vc2.tabBarItem.image = [[UIImage imageNamed:@"BarItemNormal2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc2.tabBarItem.selectedImage = [[UIImage imageNamed:@"BarItemSelected2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc2.tabBarItem.title = @"次页";
    vc2.title = vc2.tabBarItem.title;
    [vc2.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:102.0/255 green:102.0/255 blue:102.0/255 alpha:1.0],NSForegroundColorAttributeName, [UIFont systemFontOfSize:10.0],NSFontAttributeName,nil] forState:UIControlStateNormal];
    [vc2.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor orangeColor],NSForegroundColorAttributeName, [UIFont systemFontOfSize:10.0],NSFontAttributeName,nil] forState:UIControlStateSelected];
    HYNavgationController *nav2 = [[HYNavgationController alloc] initWithRootViewController:vc2];
    
    self.viewControllers = @[nav1, nav2];
}



@end
