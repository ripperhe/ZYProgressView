//
//  ZYLineProgressViewConfig.m
//  ZYLineProgressViewDemo
//
//  GitHub https://github.com/ripperhe
//  Created by ripper on 2017/3/1.
//  Copyright © 2017年 ripper. All rights reserved.
//

#import "ZYLineProgressViewConfig.h"

@implementation ZYLineProgressViewConfig

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.capType = ZYLineProgressViewCapTypeRound;
        self.backLineColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.00];
        self.progressLineColor = [UIColor colorWithRed:0.14 green:0.78 blue:0.54 alpha:1.00];
        
        self.isShowDot = NO;
        self.dotSpace = 1;
        self.dotColor = [UIColor whiteColor];
    }
    return self;
}

@end
