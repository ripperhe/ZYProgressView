//
//  ZYLineProgressViewConfig.h
//  ZYLineProgressViewDemo
//
//  GitHub https://github.com/ripperhe
//  Created by ripper on 2017/3/1.
//  Copyright © 2017年 ripper. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ZYLineProgressViewCapType) {
    ZYLineProgressViewCapTypeRound,
    ZYLineProgressViewCapTypeSquare,
};

@interface ZYLineProgressViewConfig : NSObject

/** 端点类型 */
@property (nonatomic, assign) ZYLineProgressViewCapType capType;
/** 背景条颜色 */
@property (nonatomic, strong) UIColor *backLineColor;
/** 进度条颜色 */
@property (nonatomic, strong) UIColor *progressLineColor;

/** 是否显示进度点 */
@property (nonatomic, assign) BOOL isShowDot;
/** 进度点和进度条的半径差值 */
@property (nonatomic, assign) CGFloat dotSpace;
/** 进度点颜色 */
@property (nonatomic, strong) UIColor *dotColor;

@end
