//
//  ZYCircleProgressViewConfig.m
//  ZYCircleProgressViewDemo
//
//  Created by ripper on 2017/1/6.
//  Copyright © 2017年 ripper. All rights reserved.
//

#import "ZYCircleProgressViewConfig.h"

@implementation ZYCircleProgressViewConfig


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.lineWidth = 2;
        self.lineCap = kCALineCapRound;
        self.backLineColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.00];
        self.progressLineColor = [UIColor colorWithRed:0.14 green:0.78 blue:0.54 alpha:1.00];
        self.startAngle = - M_PI_2;
        self.endAngle = M_PI + M_PI_2;
        self.clockwise = YES;
    }
    return self;
}

@end
