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
    
    
    ZYCircleProgressView *progressView = [[ZYCircleProgressView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:progressView];
    self.progressView = progressView;
    
    self.progressView.progress = 0.3;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.progressView updateConfig:^(ZYCircleProgressViewConfig *config) {
        config.backLineColor = [UIColor lightGrayColor];
        config.progressLineColor = [UIColor orangeColor];
        config.lineWidth = 3;
        config.lineCap = kCALineCapRound;
        config.startAngle = - (M_PI + M_PI_4);
        config.endAngle = M_PI_4;
    }];

    self.progressView.progress = 0.8;
}

@end
