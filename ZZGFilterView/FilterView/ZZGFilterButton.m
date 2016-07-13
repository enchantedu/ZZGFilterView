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

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

@end
