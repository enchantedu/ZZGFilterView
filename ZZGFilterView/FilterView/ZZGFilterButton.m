//
//  ZZGFilterButton.m
//  ZZGFilterView
//
//  Created by dito on 16/7/12.
//  Copyright © 2016年 zouzhigang. All rights reserved.
//

#import "ZZGFilterButton.h"
#import "ZZGFilterConst.h"

@implementation ZZGFilterButton

- (instancetype)initWithDict:(NSDictionary *)dict normalImageNamed:(NSString *)normalImageName selectedImageNamed:(NSString *)selectedImageName {
    self = [super init];
    if (self) {
        self.dict = dict;
        [self setTitle:dict[kTitle] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    }
    return self;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
    [self sizeToFit];
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state {
    [super setImage:image forState:state];
    [self sizeToFit];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat padding = 2;
    CGFloat horizontalMargin = (self.frame.size.width - (self.titleLabel.frame.size.width + self.imageView.frame.size.width + padding)) / 2;
    
    CGRect titleLabelF = self.titleLabel.frame;
    titleLabelF.origin.x = horizontalMargin;
    self.titleLabel.frame = titleLabelF;
    
    CGRect imageViewF = self.imageView.frame;
    imageViewF.origin.x = CGRectGetMaxX(self.titleLabel.frame) + padding;
    self.imageView.frame = imageViewF;
}

@end