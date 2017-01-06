//
//  ViewController.m
//  ZYCircleProgressViewDemo
//
//  Created by ripper on 2017/1/6.
//  Copyright © 2017年 ripper. All rights reserved.
//

#import "ViewController.h"
#import "ZYCircleProgressView.h"

@interface ViewController ()

@property (nonatomic, weak) ZYCircleProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 示例 1
    ZYCircleProgressView *progressView = [[ZYCircleProgressView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    progressView.progress = 0.3;
    [self.view addSubview:progressView];
    self.progressView = progressView;


    // 示例 2
    ZYCircleProgressView *progressView2 = [[ZYCircleProgressView alloc] initWithFrame:CGRectMake(100, 250, 100, 100)];
    [self.view addSubview:progressView2];
    
    progressView2.progress = 0.7;
    [progressView2 updateConfig:^(ZYCircleProgressViewConfig *config) {
        config.backLineColor = [UIColor lightGrayColor];
        config.progressLineColor = [UIColor orangeColor];
        config.lineWidth = 2;
        config.startAngle = - (M_PI + M_PI_4);
        config.endAngle = M_PI_4;
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.progressView updateConfig:^(ZYCircleProgressViewConfig *config) {
        config.lineWidth = 3;
        config.lineCap = kCALineCapSquare;
    }];

    self.progressView.progress = 0.8;
}

@end
