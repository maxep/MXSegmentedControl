# MXSegmentedControl

[![CI Status](http://img.shields.io/travis/maxep/MXSegmentedControl.svg?style=flat)](https://travis-ci.org/maxep/MXSegmentedControl)
[![Version](https://img.shields.io/cocoapods/v/MXSegmentedControl.svg?style=flat)](http://cocoadocs.org/docsets/MXSegmentedControl)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/MXSegmentedControl.svg?style=flat)](http://cocoadocs.org/docsets/MXSegmentedControl)
[![Platform](https://img.shields.io/cocoapods/p/MXSegmentedControl.svg?style=flat)](http://cocoadocs.org/docsets/MXSegmentedControl)

Yet another segmented control for iOS inspired by [Segmentio](https://github.com/Yalantis/Segmentio) & [HMSegmentedPager](https://github.com/HeshamMegid/HMSegmentedControl).
MXSegmentedControl is easy to integrate and very customizable. It dynamically computes the segments width to fit or fill its content, it can also track a UIScrollView content offset to change segment.

<p align="center">
<img src="screencast.gif" width=320 />
</p>

## Installation

MXSegmentedControl is available through [CocoaPods](https://cocoapods.org/pods/MXSegmentedControl). To install
it, simply add the following line to your Podfile:

```
pod 'MXSegmentedControl'
```

## Usage

+ You can configure a simple segmented control like following:

```swift
segmentedControl.append(title: "First")
segmentedControl.append(title: "Second")
segmentedControl.append(title: "Third")
```
                                               
## Author

[Maxime Epain](http://maxep.me)
                                               
## License
                                               
MXSegmentedControl is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
