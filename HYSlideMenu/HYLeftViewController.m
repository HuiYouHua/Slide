//
//  HYLeftViewController.m
//  HYSlideMenu
//
//  Created by 华惠友 on 2018/5/25.
//  Copyright © 2018年 华惠友. All rights reserved.
//

#import "HYLeftViewController.h"

@interface HYLeftViewController ()
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation HYLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    _dataSource = [NSMutableArray arrayWithObjects:@"了解会员特权", @"QQ钱包", @"个性装扮", @"我的收藏", @"我的相册", @"我的文件", @"免流量特权", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(didSelectRow:title:)]) {
        [self.delegate didSelectRow:indexPath.row title:self.dataSource[indexPath.row]];
    }
}

- (IBAction)setUp:(id)sender {
}

- (IBAction)switchTheme:(id)sender {
}

@end

