//
//  ViewController.m
//  PLAttributeDemo
//
//  Created by 张征鸿 on 2017/11/29.
//  Copyright © 2017年 张征鸿. All rights reserved.
//

#import "ViewController.h"
#import "PLAttribute.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.label pl_makeAttrWithMaker:^(PLAttributeMaker * _Nullable make) {
        make.fontColor([UIColor orangeColor]).range(NSMakeRange(0, 10));
        make.fontColor([UIColor orangeColor]).range(NSMakeRange(15, 20));
        make.strokeColor([UIColor blueColor]);
        make.strokeWidth(NSUnderlineStyleSingle);
        make.lineSpace(5);
        make.lineBreakMode(NSLineBreakByTruncatingTail);
    }];
    
    CGSize size = self.label.make.boundingSize(CGSizeMake(200, 0));
    UIView *view = [UIView new];
    view.frame = (CGRect){0, 0, size};
    view.center = (CGPoint){self.view.center.x, self.view.center.y - 150};
    view.backgroundColor = [UIColor orangeColor];
    view.alpha = 0.5;
    [self.view addSubview:view];
    [self.view sendSubviewToBack:view];
    
//    [self.textView pl_makeAttrWithMaker:^(PLAttributeMaker * _Nullable make) {
//        make.font([UIFont systemFontOfSize:18])
//        .link().range(NSMakeRange(0, 10));
//    }];
    
//    [self.textView pl_updateAttrWithMaker:^(PLAttributeMaker * _Nullable update) {
//        update.font([UIFont systemFontOfSize:28]);
//    }];

//    [self.label pl_updateAttrWithMaker:^(PLAttributeMaker * _Nullable update) {
//        update.lineSpace(20);
//    }];
//
//    [self.label pl_deleteAttrWithMaker:^(PLAttributeMaker * _Nullable deleter) {
//        deleter.lineSpace(0).strokeColor(nil).strokeWidth(0);
//    }];
    
}

- (void)test
{
    //    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    //    style.lineSpacing = 10;
    //    style.paragraphSpacing = 20;
    //    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self.label.text];
    //    [str addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, self.label.text.length)];
    //    self.label.attributedText = str;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
