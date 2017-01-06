//
//  ZYCircleProgressView.m
//  ZYCircleProgressViewDemo
//
//  Created by ripper on 2017/1/6.
//  Copyright © 2017年 ripper. All rights reserved.
//

#import "ZYCircleProgressView.h"

@interface ZYCircleProgressView ()


@property (nonatomic, weak) CAShapeLayer *backLayer;

@property (nonatomic, weak) CAShapeLayer *progressLayer;

@property (nonatomic, strong) ZYCircleProgressViewConfig *config;


@end



@implementation ZYCircleProgressView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self backLayer];
        
        [self progressLayer];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(width * 0.5, height * 0.5) radius:width * 0.5 startAngle:self.config.startAngle endAngle:self.config.endAngle clockwise:YES];
    self.backLayer.path = path.CGPath;
    self.progressLayer.path = path.CGPath;
    
    self.progressLayer.strokeEnd = self.progress;
}

#pragma mark - API
- (void)updateConfig:(void (^)(ZYCircleProgressViewConfig *config))configBlock
{
    if (!configBlock) return;
    
    configBlock(self.config);
    
    self.backLayer.lineWidth = self.config.lineWidth;
    self.backLayer.lineCap = self.config.lineCap;
    self.backLayer.strokeColor = self.config.backLineColor.CGColor;
    
    self.progressLayer.lineWidth = self.config.lineWidth;
    self.progressLayer.lineCap = self.config.lineCap;
    self.progressLayer.strokeColor = self.config.progressLineColor.CGColor;
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(width * 0.5, height * 0.5) radius:width * 0.5 startAngle:self.config.startAngle endAngle:self.config.endAngle clockwise:YES];
    self.backLayer.path = path.CGPath;
    self.progressLayer.path = path.CGPath;
}

#pragma mark - setter
- (void)setProgress:(CGFloat)progress
{
    if (progress <= 0) {
        _progress = 0;
    }else if (progress >= 1) {
        _progress = 1;
    }else{
        _progress = progress;
    }
    
    self.progressLayer.strokeEnd = _progress;
}

#pragma mark - getter
- (CAShapeLayer *)backLayer
{
    if (!_backLayer) {
        CAShapeLayer *backLayer = [CAShapeLayer layer];
        backLayer.lineWidth = self.config.lineWidth;
        backLayer.lineCap = self.config.lineCap;
        backLayer.strokeColor = self.config.backLineColor.CGColor;
        backLayer.fillColor = [UIColor clearColor].CGColor;
        [self.layer insertSublayer:backLayer atIndex:0];
        _backLayer = backLayer;
    }
    return _backLayer;
}

- (CAShapeLayer *)progressLayer
{
    if (!_progressLayer) {
        CAShapeLayer *progressLayer = [CAShapeLayer layer];
        progressLayer.lineWidth = self.config.lineWidth;
        progressLayer.lineCap = self.config.lineCap ;
        progressLayer.strokeColor = self.config.progressLineColor.CGColor;
        progressLayer.fillColor = [UIColor clearColor].CGColor;
        [self.layer addSublayer:progressLayer];
        _progressLayer = progressLayer;
    }
    return _progressLayer;
}

- (ZYCircleProgressViewConfig *)config
{
    if (!_config) {
        _config = [ZYCircleProgressViewConfig defaultConfig];
    }
    return _config;
}



@end
