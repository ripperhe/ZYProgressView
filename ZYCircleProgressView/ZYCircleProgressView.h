//
//  ZYCircleProgressView.h
//  ZYCircleProgressViewDemo
//
//  GitHub https://github.com/ripperhe
//  Created by ripper on 2017/1/6.
//  Copyright © 2017年 ripper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYCircleProgressViewConfig.h"

@interface ZYCircleProgressView : UIControl

/** 配置 */
@property (nonatomic, strong, readonly) ZYCircleProgressViewConfig *config;
/** 进度 */
@property (nonatomic, assign) CGFloat progress;


/**
 统一更新配置，在block中修改config的值

 @param configBlock 修改配置的block
 */
- (void)updateConfig:(void(^)(ZYCircleProgressViewConfig *config))configBlock;

@end
