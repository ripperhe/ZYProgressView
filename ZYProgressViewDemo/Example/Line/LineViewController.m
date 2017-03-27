//
//  LineViewController.m
//  ZYProgressViewDemo
//
//  GitHub https://github.com/ripperhe
//  Created by ripper on 2017/3/27.
//  Copyright © 2017年 ripper. All rights reserved.
//

#import "LineViewController.h"
#import "ZYLineProgressView.h"

@interface LineViewController ()

@property (nonatomic, weak) ZYLineProgressView *progressView;

@end

@implementation LineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    ZYLineProgressView *progressView = [[ZYLineProgressView alloc] initWithFrame:CGRectMake(20, 150, self.view.frame.size.width - 40, 6)];
    [progressView updateConfig:^(ZYLineProgressViewConfig *config) {
        config.isShowDot = YES;
    }];
    [self.view addSubview:progressView];
    self.progressView = progressView;
    
    progressView.progress = 0.01;

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.progressView.progress = 0.8;
}

@end
