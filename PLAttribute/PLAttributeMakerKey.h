//
//  PLAttributeMakerKey.h
//  PLAttributeDemo
//
//  Created by 张征鸿 on 2017/11/29.
//  Copyright © 2017年 张征鸿. All rights reserved.
//

#ifndef PLAttributeMakerKey_h
#define PLAttributeMakerKey_h

#if DEBUG
#define PLLog(xx, ...) NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define PLLog(xx, ...) ((void)0)
#endif

typedef NS_ENUM(NSInteger, PLVerticalGlyphStyle)
{
    PLVerticalGlyphStyleHorizontal = 0,
    PLVerticalGlyphStyleVertical = 1,
};

FOUNDATION_STATIC_INLINE bool validString(NSString *string)
{
    return ([string isKindOfClass:[NSString class]] && string.length > 0 && ![string isEqualToString:@""]);
}

NS_INLINE bool validValue(id value) {
    return ![value isKindOfClass:[NSNull class]] && value;
}

#endif /* PLAttributeMakerKey_h */
