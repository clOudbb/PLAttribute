# PLAttribute
 A simple use attribute framework.
 If you just want simple fast using attribute, try PLAttribute
 
# Feature
> Support most attribute. 

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

### set Attribute
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
