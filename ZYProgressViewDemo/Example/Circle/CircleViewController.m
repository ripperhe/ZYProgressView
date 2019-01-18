//
//  CircleViewController.m
//  ZYProgressViewDemo
//
//  GitHub https://github.com/ripperhe
//  Created by ripper on 2017/3/27.
//  Copyright © 2017年 ripper. All rights reserved.
//

#import "CircleViewController.h"
#import "ZYCircleProgressView.h"

@interface CircleViewController ()

@property (nonatomic, weak) ZYCircleProgressView *progressView;
@property (nonatomic, weak) ZYCircleProgressView *progressView2;

@end

@implementation CircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 示例 1
    ZYCircleProgressView *progressView = [[ZYCircleProgressView alloc] initWithFrame:CGRectMake(100, 150, 100, 100)];
    progressView.progress = 0.3;
    [self.view addSubview:progressView];
    self.progressView = progressView;
    
    [self.progressView addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.progressView addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
    
    
    
    // 示例 2
    ZYCircleProgressView *progressView2 = [[ZYCircleProgressView alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    [self.view addSubview:progressView2];
    
    progressView2.progress = 0.3;
    [progressView2 updateConfig:^(ZYCircleProgressViewConfig *config) {
        config.backLineColor = [UIColor lightGrayColor];
        config.progressLineColor = [UIColor orangeColor];
        config.lineWidth = 6;
        config.startAngle = M_PI_2 + M_PI_4;
        config.endAngle = M_PI * 2 + M_PI_2 - M_PI_4;
        config.clockwise = YES;
    }];
    
    self.progressView2 = progressView2;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    self.progressView.progress = 0.8;
    
    self.progressView2.progress = 0.8;
}

- (void)click:(ZYCircleProgressView *)sender
{
    NSLog(@"click");
    
    [self.progressView updateConfig:^(ZYCircleProgressViewConfig *config) {
        //        config.lineWidth = 3;
        config.lineCap = kCALineCapSquare;
    }];
    
    self.progressView.progress = 0.8;
}

- (void)valueChange:(ZYCircleProgressView *)sender
{
    NSLog(@"valueChange");
}


@end
