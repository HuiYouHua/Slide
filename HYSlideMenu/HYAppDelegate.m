//
//  HYAppDelegate.m
//  HYSlideMenu
//
//  Created by 华惠友 on 2018/5/25.
//  Copyright © 2018年 华惠友. All rights reserved.
//

#import "HYAppDelegate.h"

#import "HYMainController.h"
#import "HYLeftViewController.h"
#import "HYTabBarController.h"

@interface HYAppDelegate()

@end

@implementation HYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    
    HYLeftViewController *leftVc = [HYLeftViewController new];
    HYTabBarController *tabVc = [HYTabBarController new];
    
    HYMainController *mainVC = [[HYMainController alloc] initWithLeftViewController:leftVc mainViewController:tabVc];
    self.window.rootViewController = mainVC;
    
    return YES;
}

@end
