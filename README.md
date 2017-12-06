# PLAttribute
 A simple use attribute framework.
 If you just want simple fast using attribute, try PLAttribute
 
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
