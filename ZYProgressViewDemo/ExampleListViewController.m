//
//  ExampleListViewController.m
//  ZYProgressViewDemo
//
//  GitHub https://github.com/ripperhe
//  Created by ripper on 2017/3/27.
//  Copyright © 2017年 ripper. All rights reserved.
//

#import "ExampleListViewController.h"
#import "LineViewController.h"
#import "CircleViewController.h"

/**
 TODO:
 
 <!--需要更新的问题：
 1. 检测start,end 来确定方向
 2. 添加默认进度label-->
 */
@interface ExampleListViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *tableData;

@end

@implementation ExampleListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    __weak typeof(self) weakSelf = self;
    self.tableData = @[
                       @{
                           @"title":@"Line",
                           @"action":^{
                               LineViewController *lineVC = [LineViewController new];
                               [weakSelf.navigationController pushViewController:lineVC animated:YES];
                           }
                           },
                       @{
                           @"title":@"Circle",
                           @"action":^{
                               CircleViewController *circleVC = [CircleViewController new];
                               [weakSelf.navigationController pushViewController:circleVC animated:YES];
                           }
                           },
                       ];
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"testCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"testCell"];
    NSDictionary* info = self.tableData[indexPath.row];
    cell.textLabel.text = info[@"title"];
    cell.textLabel.textColor = [UIColor colorWithRed:0.14 green:0.78 blue:0.55 alpha:1.00];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary* info = self.tableData[indexPath.row];
    ((void(^)())info[@"action"])();
}

@end
