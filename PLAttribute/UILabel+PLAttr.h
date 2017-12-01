//
//  UILabel+PLAttr.h
//  PLAttributeDemo
//
//  Created by 张征鸿 on 2017/11/29.
//  Copyright © 2017年 张征鸿. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PLAttributeMaker.h"
@interface UILabel (PLAttr)

- (NSArray *_Nullable)pl_makeAttrWithMaker:(void(^_Nullable)(PLAttributeMaker * _Nullable make))maker;

- (NSArray *_Nullable)pl_updateAttrWithMaker:(void(^_Nullable)(PLAttributeMaker * _Nullable update))maker;

- (NSArray *_Nullable)pl_deleteAttrWithMaker:(void(^_Nullable)(PLAttributeMaker * _Nullable deleter))maker;

@property (nonatomic, strong, readonly, nullable) PLAttributeMaker *make;
@end
