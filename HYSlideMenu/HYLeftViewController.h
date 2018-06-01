//
//  HYLeftViewController.h
//  HYSlideMenu
//
//  Created by 华惠友 on 2018/5/25.
//  Copyright © 2018年 华惠友. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HYLeftViewControllerDelegate <NSObject>

- (void)didSelectRow:(NSInteger)row title:(NSString *)title;

@end

@interface HYLeftViewController : UIViewController

@property (nonatomic, weak) id <HYLeftViewControllerDelegate> delegate;

@end
