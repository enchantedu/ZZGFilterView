//
//  ZZGFilterButton.h
//  ZZGFilterView
//
//  Created by dito on 16/7/12.
//  Copyright © 2016年 zouzhigang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZGFilterButton : UIButton

@property (nonatomic, strong) NSDictionary  *dict;

- (instancetype)initWithDict:(NSDictionary *)dict normalImageNamed:(NSString *)normalImageName selectedImageNamed:(NSString *)selectedImageName;

@end
