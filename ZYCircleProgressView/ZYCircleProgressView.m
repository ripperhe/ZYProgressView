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

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self updatePath];
    self.progressLayer.strokeEnd = self.progress;
}

#pragma mark - API
- (void)updateConfig:(void (^)(ZYCircleProgressViewConfig *config))configBlock
{
    if (!configBlock) return;
    
    configBlock(self.config);
    
    [self updateLayerProperty:self.backLayer withColor:self.config.backLineColor];
    [self updateLayerProperty:self.progressLayer withColor:self.config.progressLineColor];
    [self updatePath];
}

#pragma mark - private methods
- (void)updatePath
{
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(width * 0.5, height * 0.5) radius:width * 0.5 startAngle:self.config.startAngle endAngle:self.config.endAngle clockwise:self.config.clockwise];
    self.backLayer.path = path.CGPath;
    self.progressLayer.path = path.CGPath;
}

- (void)updateLayerProperty:(CAShapeLayer *)layer withColor:(UIColor *)color
{
    layer.lineWidth = self.config.lineWidth;
    layer.lineCap = self.config.lineCap;
    layer.strokeColor = color.CGColor;
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
        backLayer.fillColor = [UIColor clearColor].CGColor;
        [self updateLayerProperty:backLayer withColor:self.config.backLineColor];
        [self.layer insertSublayer:backLayer atIndex:0];
        _backLayer = backLayer;
    }
    return _backLayer;
}

- (CAShapeLayer *)progressLayer
{
    if (!_progressLayer) {
        CAShapeLayer *progressLayer = [CAShapeLayer layer];
        progressLayer.fillColor = [UIColor clearColor].CGColor;
        [self updateLayerProperty:progressLayer withColor:self.config.progressLineColor];
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
