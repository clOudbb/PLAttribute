//
//  UILabel+PLAttr.m
//  PLAttributeDemo
//
//  Created by 张征鸿 on 2017/11/29.
//  Copyright © 2017年 张征鸿. All rights reserved.
//

#import "UILabel+PLAttr.h"
@import ObjectiveC;

FOUNDATION_STATIC_INLINE bool validString(NSString *string)
{
    return ([string isKindOfClass:[NSString class]] && string.length > 0 && ![string isEqualToString:@""]);
}

@implementation UILabel (PLAttr)

- (NSArray *)pl_makeAttr:(NSString *)string maker:(void (^)(PLAttributeMaker *))maker
{
    NSAssert(validString(string), @"string cannot be null");
    self.make = [[PLAttributeMaker alloc] initWithLabel:self];
    maker(self.make);
    return [self.make install];
}

- (NSArray *)pl_makeAttrWithMaker:(void (^)(PLAttributeMaker * _Nullable))maker
{
    return [self pl_makeAttr:self.text maker:maker];
}

- (NSArray *)pl_updateAttrWithMaker:(void (^)(PLAttributeMaker * _Nullable))maker
{
    [self.make save];
    maker(self.make);
    return [self.make update];
}

- (NSArray *)pl_deleteAttrWithMaker:(void (^)(PLAttributeMaker * _Nullable))maker
{
    [self.make save];
    [self.make setValue:@(true) forKey:@"_removeTask"];
    maker(self.make);
    return [self.make remove];
}

- (void)setMake:(PLAttributeMaker *)make
{
    objc_setAssociatedObject(self, @selector(make), make, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (PLAttributeMaker *)make
{
    return objc_getAssociatedObject(self, _cmd);
}

@end
