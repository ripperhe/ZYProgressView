# ZYProgressView

[![Version](https://img.shields.io/cocoapods/v/ZYProgressView.svg?style=flat)](http://cocoapods.org/pods/ZYProgressView)
[![License](https://img.shields.io/cocoapods/l/ZYProgressView.svg?style=flat)](http://cocoapods.org/pods/ZYProgressView)
[![Platform](https://img.shields.io/cocoapods/p/ZYProgressView.svg?style=flat)](http://cocoapods.org/pods/ZYProgressView)

## Snapshot

![](https://raw.githubusercontent.com/ripperhe/oss/master/2017/0327/lineprogressview.png) ![](https://raw.githubusercontent.com/ripperhe/oss/master/2017/0327/circleprogressview.png)

## Example

To run the example project, clone the repo, and run directory.

## Requirements

`iOS 8.0` or later

## Installation

ZYProgressView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ZYProgressView"
```

## Useage

### Line

#### 初始化

```objc
ZYLineProgressView *progressView = [[ZYLineProgressView alloc] initWithFrame:CGRectMake(20, 150, 200, 6)];

```

#### 更新进度

```objc
progressView.progress = 0.8;
```

#### 更新配置

```objc
[progressView updateConfig:^(ZYLineProgressViewConfig *config) {
	config.isShowDot = YES;
}];
```

### Circle

#### 初始化

```objc
ZYCircleProgressView *progressView = [[ZYCircleProgressView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
```

#### 更新进度

```objc
progressView.progress = 0.3;
```

#### 更新配置

```objc
[progressView updateConfig:^(ZYCircleProgressViewConfig *config) {
	config.lineWidth = 3;
	config.lineCap = kCALineCapSquare;
	config.startAngle = - (M_PI + M_PI_4);
	config.endAngle = M_PI_4;
}];
```

## Author

ripper, ripperhe@qq.com

## License

ZYProgressView is available under the MIT license. See the LICENSE file for more info.
