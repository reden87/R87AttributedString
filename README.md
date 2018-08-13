# R87AttributedString

[![Version](https://img.shields.io/cocoapods/v/R87AttributedString.svg?style=flat)](http://cocoadocs.org/docsets/R87AttributedString)
[![License](https://img.shields.io/cocoapods/l/R87AttributedString.svg?style=flat)](http://cocoadocs.org/docsets/R87AttributedString)
[![Platform](https://img.shields.io/cocoapods/p/R87AttributedString.svg?style=flat)](http://cocoadocs.org/docsets/R87AttributedString)

## Introduction

With the help of R87AttributedString you can format attributed texts easily.

For example you can add the thext #like this# or *like this* and you can specify from code how the text inside the # and * characters should look like.

![Screenshot](/Screenshots/Screenshot-01.png)

## Installation

R87AttributedString is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'R87AttributedString'
```

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

You can use the librarly like this:

```swift
let textString = "*This is amazing*\n\n#Code of Conduct#\nAll atten*d*ees, -speakers-, $sponsors$"
let attributedString = NSMutableAttributedString(string: textString)

attributedString.r87_addAttribute(name: .foregroundColor, value: UIColor.red, betweenCharacters: "*")
attributedString.r87_setAttributes(attributes: [.foregroundColor: UIColor.green], betweenCharacters: "#")
attributedString.r87_addAttributes(attributes: [.font: UIFont.systemFont(ofSize: 25)], betweenCharacters: "$")
attributedString.r87_removeAttribute(name: NSAttributedStringKey.font, betweenCharacters: "-")

textView.attributedText = attributedString
```

## Compatibility

iOS 7.0+

## License

R87AttributedString is available under the MIT license. See the LICENSE file for more info.
