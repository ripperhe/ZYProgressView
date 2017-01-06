//
//  ZYCircleProgressViewConfig.h
//  ZYCircleProgressViewDemo
//
//  Created by ripper on 2017/1/6.
//  Copyright © 2017年 ripper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZYCircleProgressViewConfig : NSObject

/** 宽度 */
@property (nonatomic, assign) CGFloat lineWidth;
/** 端点类型 kCALineCapButt | kCALineCapRound | kCALineCapSquare */
@property (nonatomic, assign) NSString *lineCap;
/** 背景条颜色 */
@property (nonatomic, strong) UIColor *backLineColor;
/** 进度条颜色 */
@property (nonatomic, strong) UIColor *progressLineColor;
/** 开始角度 弧度制 */
@property (nonatomic, assign) CGFloat startAngle;
/** 结束角度 弧度制 */
@property (nonatomic, assign) CGFloat endAngle;

+ (instancetype)defaultConfig;

@end
