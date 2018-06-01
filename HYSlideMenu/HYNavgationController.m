//
//  HYNavgationController.m
//  HYSlideMenu
//
//  Created by 华惠友 on 2018/5/25.
//  Copyright © 2018年 华惠友. All rights reserved.
//

#import "HYNavgationController.h"

#import "UIImag+ColorImage.h"

@interface HYNavgationController ()

@end

@implementation HYNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UINavigationBar appearance].barStyle = UIBarStyleBlack; [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithWhite:0.1 alpha:0.5]]; [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    UINavigationBar *navigationBar = self.navigationController.navigationBar; [navigationBar setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault]; //此处使底部线条颜色为红色
    [navigationBar setShadowImage:[UIImage imageWithColor:[UIColor redColor]]];
}
static int i=0;

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {//非根控制器
        //影藏BottomBar
        viewController.hidesBottomBarWhenPushed = YES;
         i++;
        viewController.title =  [NSString stringWithFormat:@"其他界面%d",i];
    }
    //跳转(自定义以后在这里真正跳转)
    [super pushViewController:viewController animated:animated];
}

- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated {
    i--;
    return [super popViewControllerAnimated:animated];
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
