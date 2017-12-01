//
//  PLAttributeCreater.m
//  PLAttributeDemo
//
//  Created by 张征鸿 on 2017/11/29.
//  Copyright © 2017年 张征鸿. All rights reserved.
//

#import "PLAttributeCreater.h"

@interface PLAttributeCreater ()
@end

@implementation PLAttributeCreater

+ (instancetype)attributeWithKey:(NSAttributedStringKey)attributeKey value:(id)value range:(NSRange)range
{
    PLAttributeCreater *creater = [PLAttributeCreater new];
    creater.attributeKey = attributeKey;
    creater.value = value;
    creater.range = range;
    return creater;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
