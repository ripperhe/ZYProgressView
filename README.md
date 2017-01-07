# ZYCircleProgressView

圆形进度条 🎾

![](https://raw.githubusercontent.com/ripperhe/Resource/master/20170106/circleprogressview.png)

## How to use

### 初始化

```objc
ZYCircleProgressView *progressView = [[ZYCircleProgressView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
```

### 更新进度

```objc
progressView.progress = 0.3;
```

### 更新配置

```objc
[progressView updateConfig:^(ZYCircleProgressViewConfig *config) {
	config.lineWidth = 3;
	config.lineCap = kCALineCapSquare;
	config.startAngle = - (M_PI + M_PI_4);
	config.endAngle = M_PI_4;
}];
```

<!--需要更新的问题：
1. 检测start,end 来确定方向
2. 添加默认进度label-->