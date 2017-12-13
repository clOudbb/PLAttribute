# PLAttribute
 A simple use attribute framework.
 If you just want simple fast using attribute, try PLAttribute
 
 一个简单易用的富文本框架
 如果你只是想快速简单的上手使用富文本，使用PLAttribute吧
# Feature
> Support most attribute. 
> 支持大部分富文本属性

| AttributeName Key                   |  Chinese                           |
| ----------------------------------- | ------------------------------------------------------ |
| `NSFontAttributeName`               | `字体`                              |
| `NSParagraphStyleAttributeName`     | `整体样式`                           |
| `NSForegroundColorAttributeName`    | `字体颜色`                           |
| `NSBackgroundColorAttributeName`    | `背景颜色`                           |
| `NSLigatureAttributeName`           | `连体字符`                           |
| `NSKernAttributeName`               | `字间距`                             |
| `NSStrikethroughStyleAttributeName` | `删除线`                             |
| `NSStrikethroughColorAttributeName` | `删除线颜色`                          |
| `NSUnderlineStyleAttributeName`     | `下划线`                             |
| `NSUnderlineColorAttributeName`     | `下划线颜色`                          |
| `NSStrokeColorAttributeName`        | `字体描边颜色`                        |
| `NSStrokeWidthAttributeName`        | `字体描边宽度`                        |
| `NSShadowAttributeName`             | `文字阴影`                           |
| `NSTextEffectAttributeName`         | `字体凸起`                           |
| `NSLinkAttributeName`               | `设定超链接文字（仅TextView）`         |
| `NSBaselineOffsetAttributeName`     | `基线偏移值`                         |
| `NSObliquenessAttributeName`        | `字体倾斜度`                         |
| `NSExpansionAttributeName`          | `字体横向拉伸`                       |
| `NSWritingDirectionAttributeName`   | `文字书写方向`                        |
| `NSVerticalGlyphFormAttributeName`  | `字体横竖排版`                        |

 
# Usage
Using like popular framework [Masonry](https://github.com/SnapKit/Masonry)

如果你使用过有名的Masonry框架，那么你应该会很容易使用PLAttribute

### Set Attribute
Set fontColor. default all range
```objc
[self.label pl_makeAttrWithMaker:^(PLAttributeMaker * _Nullable make) {
   make.fontColor([UIColor orangeColor]);
}];
```

Set range attribute
```objc
[self.label pl_makeAttrWithMaker:^(PLAttributeMaker * _Nullable make) {
   make.fontColor([UIColor orangeColor]).range(NSMakeRange(0, 10));
}];
```
And, you can code this
```objc
[self.label pl_makeAttrWithMaker:^(PLAttributeMaker * _Nullable make) {
   make
   .font([UIFont systemFontOfSize:17])
   .strokeColor([UIColor blueColor])
   .strikethroughStyle(NSUnderlineStyleSingle);
}];
```

If you want set attributes of a chain.
```objc
[self.label pl_makeAttrWithMaker:^(PLAttributeMaker * _Nullable make) {
   make
   .obliqueness(M_PI_4)
   .strokeColor([UIColor blueColor])
   .strokeWidth(1)
   .all(NSMakeRange(10, 20));
}];
```

If you want match some content.
```objc
[self.label pl_makeAttrWithMaker:^(PLAttributeMaker * _Nullable make) {
   make
   .fontColor([UIColor orangeColor]).match(@"React")
   .fontColor([UIColor blueColor]).match(@"Redux");
}];
```
