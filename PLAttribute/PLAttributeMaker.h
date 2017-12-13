//
//  PLAttributeMaker.h
//  PLAttributeDemo
//
//  Created by 张征鸿 on 2017/11/29.
//  Copyright © 2017年 张征鸿. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PLAttributeMakerKey.h"
@import UIKit;

@interface PLAttributeMaker : NSObject

@property (nonatomic, copy, readonly) PLAttributeMaker *(^fontColor)(UIColor *fontColor);

@property (nonatomic, copy, readonly) PLAttributeMaker *(^expansion)(CGFloat expansion); /**< 横向拉伸 */

@property (nonatomic, copy, readonly) PLAttributeMaker *(^font)(UIFont *font);

@property (nonatomic, copy, readonly) PLAttributeMaker *(^backgroundColor)(UIColor *bgColor);

@property (nonatomic, copy, readonly) PLAttributeMaker *(^shadow)(CGSize offset, CGFloat shadowBlurRadius, UIColor *shadowColor);

@property (nonatomic, copy, readonly) PLAttributeMaker *(^kernAttribute)(CGFloat space); /**< 字间距 */

@property (nonatomic, copy, readonly) PLAttributeMaker *(^textEffect)(NSTextEffectStyle style); /**< 字体凸起 */

@property (nonatomic, copy, readonly) PLAttributeMaker *(^link)(void); /**<设置link文字，仅textView可用 */

@property (nonatomic, copy, readonly) PLAttributeMaker *(^obliqueness)(CGFloat angle);  /**< 倾斜度 */

@property (nonatomic, copy, readonly) PLAttributeMaker *(^verticalGlyph)(PLVerticalGlyphStyle style);  /**< 文本横竖排版 */
/**
 *  值必须为以下组合的数组
    LRE: NSWritingDirectionLeftToRight|NSWritingDirectionEmbedding,
    RLE: NSWritingDirectionRightToLeft|NSWritingDirectionEmbedding,
    LRO: NSWritingDirectionLeftToRight|NSWritingDirectionOverride,
    RLO: NSWritingDirectionRightToLeft|NSWritingDirectionOverride
 */
@property (nonatomic, copy, readonly) PLAttributeMaker *(^writingDirection)(NSArray <NSNumber *>* direction);

@property (nonatomic, copy, readonly) PLAttributeMaker *(^baselineOffset)(CGFloat offsetY);
/**
 * 下划线
 */
@property (nonatomic, copy, readonly) PLAttributeMaker *(^underlineStyle)(NSUnderlineStyle style);

@property (nonatomic, copy, readonly) PLAttributeMaker *(^underlineColor)(UIColor *color);

/**
 * 删除线
 */
@property (nonatomic, copy, readonly) PLAttributeMaker *(^strikethroughStyle)(NSUnderlineStyle style);

@property (nonatomic, copy, readonly) PLAttributeMaker *(^strikethroughColor)(UIColor *color);

/**
 * 文字描边
 */
@property (nonatomic, copy, readonly) PLAttributeMaker *(^strokeWidth)(CGFloat width);

@property (nonatomic, copy, readonly) PLAttributeMaker *(^strokeColor)(UIColor *color);

#pragma mark - Paragraph Style

@property (nonatomic, copy, readonly) PLAttributeMaker *(^lineSpace)(CGFloat lineSpace);
@property (nonatomic, copy, readonly) PLAttributeMaker *(^lineHeightMultiple)(CGFloat multiple); /**< 行高倍数 */
@property (nonatomic, copy, readonly) PLAttributeMaker *(^paragraphSpacing)(CGFloat space); /**< 段落间距 */
@property (nonatomic, copy, readonly) PLAttributeMaker *(^paragraphSpacingBefore)(CGFloat spacingBefore); /**< 段落前间距 */
@property (nonatomic, copy, readonly) PLAttributeMaker *(^firstLineHeadIndent)(CGFloat space); /**< 首行缩进 */
@property (nonatomic, copy, readonly) PLAttributeMaker *(^headIndent)(CGFloat space);  /**< 起始位置偏移 */
@property (nonatomic, copy, readonly) PLAttributeMaker *(^tailIndent)(CGFloat space);  /**< 末尾偏移 */
@property (nonatomic, copy, readonly) PLAttributeMaker *(^alignment)(NSTextAlignment alignment);
@property (nonatomic, copy, readonly) PLAttributeMaker *(^lineBreakMode)(NSLineBreakMode mode); /**< 分割模式 */
@property (nonatomic, copy, readonly) PLAttributeMaker *(^baseWritingDirection)(NSWritingDirection direction);  /**< 段落方向 */
@property (nonatomic, copy, readonly) PLAttributeMaker *(^ligature)(PLLigatureAttributeStyle style);  /**< 设定连体字符 */

#pragma mark -
/**
 * 描绘一条链上单条属性
 */
@property (nonatomic, copy, readonly) PLAttributeMaker *(^range)(NSRange range);
/**
 * 描绘一条链上所有属性
 */
@property (nonatomic, copy, readonly) PLAttributeMaker *(^all)(NSRange range);

/** 致敬Masonry */
@property (nonatomic, copy, readonly) PLAttributeMaker *with;
/**
 * If you set range font size, bounding size maybe calculation error. waiting fix
 * 目前局部字体不一致计算高度不够准确
 */
@property (nonatomic, copy, readonly) CGSize (^boundingSize)(CGSize size);

@property (nonatomic, copy, readonly) PLAttributeMaker *(^match)(NSString *replaceStr);

- (instancetype)initWithView:(UIView *)control;
- (NSArray *)install;
- (NSArray *)update;
- (void)save;
- (NSArray *)remove;
@end
