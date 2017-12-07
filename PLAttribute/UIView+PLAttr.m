//
//  UIView+PLAttr.m
//  PLAttributeDemo
//
//  Created by 张征鸿 on 2017/12/4.
//  Copyright © 2017年 张征鸿. All rights reserved.
//

#import "UIView+PLAttr.h"
#import "PLAttributeMakerKey.h"
@import ObjectiveC;

@implementation UIView (PLAttr)

- (NSArray *)pl_makeAttr:(NSString *)string maker:(void (^)(PLAttributeMaker *))maker
{
    NSAssert(validString(string), @"string cannot be null");
    self.make = [[PLAttributeMaker alloc] initWithView:self];
    maker(self.make);
    return [self.make install];
}

- (NSArray *)pl_makeAttrWithMaker:(void (^)(PLAttributeMaker * _Nullable))maker
{
    if ([self isKindOfClass:[UILabel class]]) {
        UILabel *_label = (UILabel *)self;
        return [self pl_makeAttr:_label.text maker:maker];
    } else if ([self isKindOfClass:[UITextView class]]) {
        UITextView *_textView = (UITextView *)self;
        return [self pl_makeAttr:_textView.text maker:maker];
    }
    NSAssert(!self, @"control must be label or textview");
    return @[];
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
