//
//  PLAttributeCreater.h
//  PLAttributeDemo
//
//  Created by 张征鸿 on 2017/11/29.
//  Copyright © 2017年 张征鸿. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface PLAttributeCreater : NSObject

@property (nonatomic, strong) NSAttributedStringKey attributeKey;
@property (nonatomic, strong) id value;
@property (nonatomic, assign) NSRange range;

+ (instancetype)attributeWithKey:(NSAttributedStringKey)attributeKey
                           value:(id)value
                           range:(NSRange)range;

@end
