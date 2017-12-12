//
//  PLAttributeMaker.m
//  PLAttributeDemo
//
//  Created by 张征鸿 on 2017/11/29.
//  Copyright © 2017年 张征鸿. All rights reserved.
//

#import "PLAttributeMaker.h"
#import "PLAttributeCreater.h"
@import CoreText;

@interface PLAttributeMaker ()
@property (nonatomic, weak) UILabel *label;
@property (nonatomic, weak) UITextView *textView;
@property (nonatomic, strong) NSMutableArray *attributeArray;
@property (nonatomic, strong) NSMutableArray *updateSaveArray;
@property (nonatomic, strong) NSMutableAttributedString *tempAttributeString;
@property (nonatomic, strong) NSMutableParagraphStyle *paragraphStyle;
@property (nonatomic, strong) NSMutableParagraphStyle *orignalStyle;

@property (nonatomic, copy) CGSize (^boundingS)(CGSize size);
@property (nonatomic, assign) BOOL removeTask;
@end

@implementation PLAttributeMaker

- (instancetype)initWithView:(UIView *)control
{
    self = [super init];
    if (self) {
        if ([control isKindOfClass:[UILabel class]]) {
            self.label = (UILabel *)control;
            self.tempAttributeString = [[NSMutableAttributedString alloc] initWithString:self.label.text];
        } else if ([control isKindOfClass:[UITextView class]]) {
            self.textView = (UITextView *)control;
            self.tempAttributeString = [[NSMutableAttributedString alloc] initWithString:self.textView.text];
        }
        self.attributeArray = [@[] mutableCopy];
        self.paragraphStyle = [NSMutableParagraphStyle new];
    }
    return self;
}

#pragma mark - attribute property
- (PLAttributeMaker *(^)(UIColor *))fontColor
{
    return ^id(UIColor *color){
        PLAttributeCreater *creater = [PLAttributeCreater attributeWithKey:NSForegroundColorAttributeName value:color range:NSMakeRange(0, _tempAttributeString.length)];
        [_attributeArray addObject:creater];
        return self;
    };
}

- (PLAttributeMaker *(^)(CGFloat))expansion
{
    return ^id(CGFloat expansion) {
        PLAttributeCreater *creater = [PLAttributeCreater attributeWithKey:NSExpansionAttributeName value:@(expansion) range:NSMakeRange(0, _tempAttributeString.length)];
        [_attributeArray addObject:creater];
        return self;
    };
}

- (PLAttributeMaker *(^)(UIFont *))font
{
    return ^id(UIFont *font) {
        PLAttributeCreater *creater = [PLAttributeCreater attributeWithKey:NSFontAttributeName value:font range:NSMakeRange(0, _tempAttributeString.length)];
        [_attributeArray addObject:creater];
        return self;
    };
}

- (PLAttributeMaker *(^)(UIColor *))backgroundColor
{
    return ^id(UIColor *bgColor){
        PLAttributeCreater *creater = [PLAttributeCreater attributeWithKey:NSBackgroundColorAttributeName value:bgColor range:NSMakeRange(0, _tempAttributeString.length)];
        [_attributeArray addObject:creater];
        return self;
    };
}

- (PLAttributeMaker *(^)(CGSize, CGFloat, UIColor *))shadow
{
    return ^id(CGSize offset, CGFloat shadowBlurRadius, UIColor *shadowColor) {
        if (!shadowColor) { shadowColor = [UIColor blackColor]; }
        NSShadow *shadow = [NSShadow new];
        shadow.shadowColor = shadowColor;
        shadow.shadowBlurRadius = shadowBlurRadius;
        shadow.shadowOffset = offset;
        PLAttributeCreater *creater = [PLAttributeCreater attributeWithKey:NSShadowAttributeName value:shadow range:NSMakeRange(0, _tempAttributeString.length)];
        [_attributeArray addObject:creater];
        return self;
    };
}

- (PLAttributeMaker *(^)(CGFloat))kernAttribute
{
    return ^id(CGFloat space) {
        PLAttributeCreater *creater = [PLAttributeCreater attributeWithKey:NSKernAttributeName value:@(space) range:NSMakeRange(0, _tempAttributeString.length)];
        [_attributeArray addObject:creater];
        return self;
    };
}

- (PLAttributeMaker *(^)(UIColor *))underlineColor
{
    return ^id(UIColor *color) {
        PLAttributeCreater *creater = [PLAttributeCreater attributeWithKey:NSUnderlineColorAttributeName value:color range:NSMakeRange(0, _tempAttributeString.length)];
        [_attributeArray addObject:creater];
        return self;
    };
}

- (PLAttributeMaker *(^)(NSUnderlineStyle))underlineStyle
{
    return ^id(NSUnderlineStyle style) {
        PLAttributeCreater *creater = [PLAttributeCreater attributeWithKey:NSUnderlineStyleAttributeName value:@(style) range:NSMakeRange(0, _tempAttributeString.length)];
        [_attributeArray addObject:creater];
        return self;
    };
}

- (PLAttributeMaker *(^)(NSUnderlineStyle))strikethroughStyle
{
    return ^id(NSUnderlineStyle style) {
        PLAttributeCreater *creater = [PLAttributeCreater attributeWithKey:NSStrikethroughStyleAttributeName value:@(style) range:NSMakeRange(0, _tempAttributeString.length)];
        [_attributeArray addObject:creater];
        return self;
    };
}

- (PLAttributeMaker *(^)(UIColor *))strikethroughColor
{
    return ^id(UIColor *color) {
        PLAttributeCreater *creater = [PLAttributeCreater attributeWithKey:NSStrikethroughColorAttributeName value:color range:NSMakeRange(0, _tempAttributeString.length)];
        [_attributeArray addObject:creater];
        return self;
    };
}

- (PLAttributeMaker *(^)(UIColor *))strokeColor
{
    return ^id(UIColor *color) {
        PLAttributeCreater *creater = [PLAttributeCreater attributeWithKey:NSStrokeColorAttributeName value:color range:NSMakeRange(0, _tempAttributeString.length)];
        [_attributeArray addObject:creater];
        return self;
    };
}

- (PLAttributeMaker *(^)(CGFloat))strokeWidth
{
    return ^id(CGFloat width) {
        PLAttributeCreater *creater = [PLAttributeCreater attributeWithKey:NSStrokeWidthAttributeName value:@(width) range:NSMakeRange(0, _tempAttributeString.length)];
        [_attributeArray addObject:creater];
        return self;
    };
}

- (PLAttributeMaker *(^)(NSTextEffectStyle))textEffect
{
    return ^id(NSTextEffectStyle style) {
        PLAttributeCreater *creater = [PLAttributeCreater attributeWithKey:NSTextEffectAttributeName value:style range:NSMakeRange(0, _tempAttributeString.length)];
        [_attributeArray addObject:creater];
        return self;
    };
}

- (PLAttributeMaker *(^)(void))link
{
    return ^id(void) {
        NSAssert(_textView, @"this property only using textView");
        _textView.editable = false;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        NSString *newUrlString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                                       (CFStringRef)_tempAttributeString.string,
                                                                                                       NULL,
                                                                                                       (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                                       kCFStringEncodingUTF8));
#pragma clang diagnostic pop
        NSURL *url = [NSURL URLWithString:newUrlString];
        PLAttributeCreater *creater = [PLAttributeCreater attributeWithKey:NSLinkAttributeName value:url range:NSMakeRange(0, _tempAttributeString.length)];
        [_attributeArray addObject:creater];
        return self;
    };
}

- (PLAttributeMaker *(^)(CGFloat))obliqueness
{
    return ^id(CGFloat angle) {
        PLAttributeCreater *creater = [PLAttributeCreater attributeWithKey:NSObliquenessAttributeName value:@(angle) range:NSMakeRange(0, _tempAttributeString.length)];
        [_attributeArray addObject:creater];
        return self;
    };
}

- (PLAttributeMaker *(^)(PLVerticalGlyphStyle))verticalGlyph
{
    return ^id(PLVerticalGlyphStyle style) {
        PLAttributeCreater *creater = [PLAttributeCreater attributeWithKey:NSVerticalGlyphFormAttributeName value:@(style) range:NSMakeRange(0, _tempAttributeString.length)];
        [_attributeArray addObject:creater];
        return self;
    };
}

- (PLAttributeMaker *(^)(NSArray<NSNumber *> *))writingDirection
{
    return ^id(NSArray *direction) {
        PLAttributeCreater *creater = [PLAttributeCreater attributeWithKey:NSWritingDirectionAttributeName value:direction range:NSMakeRange(0, _tempAttributeString.length)];
        [_attributeArray addObject:creater];
        return self;
    };
}

- (PLAttributeMaker *(^)(CGFloat))baselineOffset
{
    return ^id(CGFloat offsetY) {
        PLAttributeCreater *creater = [PLAttributeCreater attributeWithKey:NSBaselineOffsetAttributeName value:@(offsetY) range:NSMakeRange(0, _tempAttributeString.length)];
        [_attributeArray addObject:creater];
        return self;
    };
}

#pragma mark - Paragraph Style

- (PLAttributeMaker *(^)(NSLineBreakMode))lineBreakMode
{
    return ^id(NSLineBreakMode mode) {
        if (_removeTask) {
            self.paragraphStyle.lineBreakMode = self.orignalStyle.lineBreakMode;
            return self;
        }
        self.paragraphStyle.lineBreakMode = mode;
        return self;
    };
}

- (PLAttributeMaker *(^)(NSTextAlignment))alignment
{
    return ^id(NSTextAlignment align) {
        if (_removeTask) {
            self.paragraphStyle.alignment = self.orignalStyle.alignment;
            return self;
        }
        self.paragraphStyle.alignment = align;
        return self;
    };
}

- (PLAttributeMaker *(^)(CGFloat))lineSpace
{
    return ^id(CGFloat space) {
        if (_removeTask) {
            self.paragraphStyle.lineSpacing = self.orignalStyle.lineSpacing;
            return self;
        }
        self.paragraphStyle.lineSpacing = space;
        return self;
    };
}

- (PLAttributeMaker *(^)(NSWritingDirection))baseWritingDirection
{
    return ^id(NSWritingDirection direction) {
        if (_removeTask) {
            self.paragraphStyle.baseWritingDirection = self.orignalStyle.baseWritingDirection;
            return self;
        }
        self.paragraphStyle.baseWritingDirection = direction;
        return self;
    };
}

- (PLAttributeMaker *(^)(CGFloat))lineHeightMultiple
{
    return ^id(CGFloat mult) {
        if (_removeTask) {
            self.paragraphStyle.baseWritingDirection = self.orignalStyle.lineHeightMultiple;
            return self;
        }
        self.paragraphStyle.lineHeightMultiple = mult;
        return self;
    };
}

- (PLAttributeMaker *(^)(CGFloat))paragraphSpacing
{
    return ^id(CGFloat space) {
        if (_removeTask) {
            self.paragraphStyle.paragraphSpacing = self.orignalStyle.paragraphSpacing;
            return self;
        }
        self.paragraphStyle.paragraphSpacing = space;
        return self;
    };
}

- (PLAttributeMaker *(^)(CGFloat))paragraphSpacingBefore
{
    return ^id(CGFloat space) {
        if (_removeTask) {
            self.paragraphStyle.paragraphSpacingBefore = self.orignalStyle.paragraphSpacingBefore;
            return self;
        }
        self.paragraphStyle.paragraphSpacingBefore = space;
        return self;
    };
}

- (PLAttributeMaker *(^)(CGFloat))firstLineHeadIndent
{
    return ^id(CGFloat space) {
        if (_removeTask) {
            self.paragraphStyle.firstLineHeadIndent = self.orignalStyle.firstLineHeadIndent;
            return self;
        }
        self.paragraphStyle.firstLineHeadIndent = space;
        return self;
    };
}

- (PLAttributeMaker *(^)(CGFloat))headIndent
{
    return ^id(CGFloat space) {
        if (_removeTask) {
            self.paragraphStyle.headIndent = self.orignalStyle.headIndent;
            return self;
        }
        self.paragraphStyle.headIndent = space;
        return self;
    };
}

- (PLAttributeMaker *(^)(CGFloat))tailIndent
{
    return ^id(CGFloat space) {
        if (_removeTask) {
            self.paragraphStyle.tailIndent = self.orignalStyle.tailIndent;
            return self;
        }
        self.paragraphStyle.tailIndent = space;
        return self;
    };
}

#pragma mark -

- (PLAttributeMaker *(^)(NSRange))range
{
    return ^id(NSRange range) {
        PLAttributeCreater *c = _attributeArray.lastObject;
        c.range = range;
        return self;
    };
}

- (PLAttributeMaker *(^)(NSRange))all
{
    return ^id(NSRange range) {
        for (PLAttributeCreater *c in _attributeArray) {
            c.range = range;
        }
        return self;
    };
}

- (CGSize (^)(CGSize))boundingSize
{
    return ^CGSize(CGSize size) {
        return self.boundingS(size);
    };
}

- (PLAttributeMaker *(^)(NSString *))match
{
    return ^id(NSString *string) {
        PLAttributeCreater *creater = _attributeArray.lastObject;
        NSString *tempStr = _tempAttributeString.string;
        NSMutableArray *results = [@[] mutableCopy];
        NSRange searchRange = NSMakeRange(0, tempStr.length);
        NSRange range;
        while ((range = [tempStr rangeOfString:string options:0 range:searchRange]).location != NSNotFound) {
            [results addObject:[NSValue valueWithRange:range]];
            searchRange = NSMakeRange(NSMaxRange(range), tempStr.length - NSMaxRange(range));
        }
        creater.matchRange = results;
        return self;
    };
}

#pragma mark -
- (PLAttributeMaker *)with { return self; }

- (NSArray *)install
{
    if (!_attributeArray) return @[];
    NSMutableParagraphStyle *style = nil;
    bool _haveFontSize = false;
    if (_paragraphStyle)
    {
        PLAttributeCreater *para = [PLAttributeCreater attributeWithKey:NSParagraphStyleAttributeName value:_paragraphStyle range:NSMakeRange(0, _tempAttributeString.length)];
        [_attributeArray addObject:para];
    }
    for (PLAttributeCreater *creater in _attributeArray) {
        if (creater.matchRange) {
            for (NSValue *rangeValue in creater.matchRange) {
                @autoreleasepool {
                    NSRange range = [rangeValue rangeValue];
                    [_tempAttributeString addAttribute:creater.attributeKey value:creater.value range:range];
                }
            }
            continue;
        }
        [_tempAttributeString addAttribute:creater.attributeKey value:creater.value range:creater.range];
        if ([creater.attributeKey isEqualToString:NSParagraphStyleAttributeName]) {
            style = [creater.value mutableCopy];
            style.lineBreakMode = NSLineBreakByWordWrapping;
        }
        if ([creater.attributeKey isEqualToString:NSFontAttributeName]) {
            _haveFontSize = true;
        }
    }
    CGSize boundSize = CGSizeZero;
    if (_label) {
        _label.attributedText = _tempAttributeString;
        boundSize = (CGSize){_label.frame.size.width, MAXFLOAT};
    }
    if (_textView) {
        _textView.attributedText = _tempAttributeString;
        boundSize = (CGSize){_textView.frame.size.width, MAXFLOAT};
    }
    
    NSMutableAttributedString *tempStr = [_tempAttributeString mutableCopy];
    if (style) {
        //由于计算文本是lineBreakMode 为其他模式时 会导致只计算一行高度，重新copy一份计算
        [tempStr removeAttribute:NSParagraphStyleAttributeName range:NSMakeRange(0, tempStr.length)];
        [tempStr addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, tempStr.length)];
    }
    if (!_haveFontSize) {
        //计算高度需要设定字体大小，否则会以系统默认计算不准确
        if (_label) {
            [tempStr addAttribute:NSFontAttributeName value:self.label.font range:NSMakeRange(0, tempStr.length)];
        } else if (_textView) {
            [tempStr addAttribute:NSFontAttributeName value:self.textView.font range:NSMakeRange(0, tempStr.length)];
        }
    }
    
    self.boundingS = ^CGSize(CGSize size) {
        CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)tempStr);
        CGSize fitSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, [tempStr length]), NULL, boundSize, NULL);
        CFRelease(framesetter);
        return fitSize;
    };
    
    return _attributeArray;
}

- (NSArray *)remove
{
    NSMutableArray *newAttrArray = [_updateSaveArray mutableCopy];
    [_attributeArray enumerateObjectsUsingBlock:^(PLAttributeCreater *  _Nonnull newAttr, NSUInteger idx, BOOL * _Nonnull stop) {
        [_updateSaveArray enumerateObjectsUsingBlock:^(PLAttributeCreater *  _Nonnull oldAttr, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([newAttr.attributeKey isEqualToString:oldAttr.attributeKey] && NSEqualRanges(newAttr.range, oldAttr.range)) {
                [_tempAttributeString removeAttribute:oldAttr.attributeKey range:oldAttr.range];
                [newAttrArray removeObject:newAttr];
            }
        }];
    }];
    if (_label) { _label.attributedText = _tempAttributeString; }
    if (_textView) { _textView.attributedText = _tempAttributeString; }
    _removeTask = false;
    _attributeArray = newAttrArray;
    return _attributeArray;
}

- (void)save
{
    _updateSaveArray = [NSMutableArray arrayWithArray:_attributeArray];
    if (_attributeArray && _attributeArray.count > 0) {
        [_attributeArray removeAllObjects];
    }
}

- (NSArray *)update
{
    NSMutableArray *newAttrArray = [@[] mutableCopy];
    [_attributeArray enumerateObjectsUsingBlock:^(PLAttributeCreater *  _Nonnull newAttr, NSUInteger idx, BOOL * _Nonnull stop) {
        [_updateSaveArray enumerateObjectsUsingBlock:^(PLAttributeCreater *  _Nonnull oldAttr, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([newAttr.attributeKey isEqualToString:oldAttr.attributeKey] && NSEqualRanges(newAttr.range, oldAttr.range)) {
                NSAssert(validValue(newAttr.value), @"attribute value can not be nil");
                [_tempAttributeString removeAttribute:oldAttr.attributeKey range:oldAttr.range];
                [_tempAttributeString addAttribute:newAttr.attributeKey value:newAttr.value range:newAttr.range];
                [newAttrArray addObject:newAttr];
            } else {
                if ([newAttr.attributeKey isEqualToString:oldAttr.attributeKey] && !NSEqualRanges(newAttr.range, oldAttr.range)) {
                    PLLog(@"update attribute range must be equal");
                }
                [newAttrArray addObject:oldAttr];
            }
        }];
    }];
    if (_label) { _label.attributedText = _tempAttributeString; }
    if (_textView) { _textView.attributedText = _tempAttributeString; }
    _attributeArray = newAttrArray;
    if (newAttrArray.count == 0) _attributeArray = [_updateSaveArray mutableCopy];
    return _attributeArray;
}

#pragma mark -
- (NSMutableParagraphStyle *)paragraphStyle
{
    if (!_paragraphStyle) {
        _paragraphStyle = [NSMutableParagraphStyle new];
    }
    return _paragraphStyle;
}

- (NSMutableParagraphStyle *)orignalStyle
{
    if (!_orignalStyle) {
        _orignalStyle = [NSMutableParagraphStyle new];
    }
    return _orignalStyle;
}

@end
