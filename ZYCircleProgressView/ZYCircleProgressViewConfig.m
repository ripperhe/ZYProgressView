//
//  ZYCircleProgressViewConfig.m
//  ZYCircleProgressViewDemo
//
//  Created by ripper on 2017/1/6.
//  Copyright © 2017年 ripper. All rights reserved.
//

#import "ZYCircleProgressViewConfig.h"

@implementation ZYCircleProgressViewConfig

+ (instancetype)defaultConfig
{
    ZYCircleProgressViewConfig *config = [[ZYCircleProgressViewConfig alloc] init];
    config.lineWidth = 2;
    config.lineCap = kCALineCapRound;
    config.backLineColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.00];
    config.progressLineColor = [UIColor colorWithRed:0.14 green:0.78 blue:0.54 alpha:1.00];
    config.startAngle = - M_PI_2;
    config.endAngle = M_PI + M_PI_2;
    config.clockwise = YES;
    return config;
}



@end
