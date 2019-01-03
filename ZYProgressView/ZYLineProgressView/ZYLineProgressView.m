//
//  ZYLineProgressView.m
//  ZYLineProgressViewDemo
//
//  GitHub https://github.com/ripperhe
//  Created by ripper on 2017/3/1.
//  Copyright © 2017年 ripper. All rights reserved.
//

#import "ZYLineProgressView.h"

@interface ZYLineProgressView ()

@property (nonatomic, strong) ZYLineProgressViewConfig *config;

@property (nonatomic, weak) CAShapeLayer *backLayer;
@property (nonatomic, weak) CAShapeLayer *progressLayer;
@property (nonatomic, weak) CAShapeLayer *dotLayer;

@end

@implementation ZYLineProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self updateFrame];
}

#pragma mark - API
- (void)updateConfig:(void (^)(ZYLineProgressViewConfig *config))configBlock
{
    if (!configBlock) return;
    
    configBlock(self.config);
    
    self.backLayer.backgroundColor = self.config.backLineColor.CGColor;
    self.progressLayer.backgroundColor = self.config.progressLineColor.CGColor;
    _dotLayer.backgroundColor = self.config.dotColor.CGColor;
    [self updateFrame];
}

#pragma mark - private methods
- (void)updateFrame
{
    // corner radius
    if (self.config.capType == ZYLineProgressViewCapTypeRound) {
        self.backLayer.cornerRadius = self.frame.size.height * 0.5;
        self.progressLayer.cornerRadius = self.backLayer.cornerRadius;
    }else{
        self.backLayer.cornerRadius = 0;
        self.progressLayer.cornerRadius = 0;
    }
    
    // back progress
    self.backLayer.frame = self.bounds;
    self.progressLayer.frame = CGRectMake(0, 0, self.frame.size.width * _progress, self.frame.size.height);
    
    // dot
    if (self.config.isShowDot) {
        
        if (self.progressLayer.frame.size.width > self.progressLayer.frame.size.height) {
            self.dotLayer.hidden = NO;
        }else{
            self.dotLayer.hidden = YES;
        }

        CGFloat dotW = self.progressLayer.frame.size.height - 2 * self.config.dotSpace;
        if (dotW > 0) {
            CGFloat dotH = dotW;
            CGFloat dotX = self.progressLayer.frame.size.width - self.progressLayer.frame.size.height + self.config.dotSpace;
            CGFloat dotY = self.config.dotSpace;
            self.dotLayer.cornerRadius = dotW * 0.5;
            self.dotLayer.frame = CGRectMake(dotX, dotY, dotW, dotH);
        }else{
            [_dotLayer removeFromSuperlayer];
            _dotLayer = nil;
        }
    }
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
    self.progressLayer.frame = CGRectMake(0, 0, self.frame.size.width * _progress, self.frame.size.height);
    if (_dotLayer) {
        if (self.progressLayer.frame.size.width > self.progressLayer.frame.size.height) {
            self.dotLayer.hidden = NO;
            CGFloat dotX = self.progressLayer.frame.size.width - self.progressLayer.frame.size.height + self.config.dotSpace;
            self.dotLayer.frame = CGRectMake(dotX,
                                             self.dotLayer.frame.origin.y,
                                             self.dotLayer.frame.size.width,
                                             self.dotLayer.frame.size.width);
        }else{
            self.dotLayer.hidden = YES;
        }
    }
}

#pragma mark - getter
- (ZYLineProgressViewConfig *)config
{
    if (!_config) {
        _config = [ZYLineProgressViewConfig new];
    }
    return _config;
}

- (CAShapeLayer *)backLayer
{
    if (!_backLayer) {
        CAShapeLayer *backLayer = [CAShapeLayer layer];
        backLayer.fillColor = [UIColor clearColor].CGColor;
        backLayer.backgroundColor = self.config.backLineColor.CGColor;
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
        progressLayer.backgroundColor = self.config.progressLineColor.CGColor;
        [self.layer addSublayer:progressLayer];
        _progressLayer = progressLayer;
    }
    return _progressLayer;
}

- (CAShapeLayer *)dotLayer
{
    if (!_dotLayer) {
        CAShapeLayer *dotLayer = [CAShapeLayer layer];
        dotLayer.fillColor = [UIColor clearColor].CGColor;
        dotLayer.backgroundColor = self.config.dotColor.CGColor;
        [self.layer addSublayer:dotLayer];
        _dotLayer = dotLayer;
    }
    return _dotLayer;
}


@end
