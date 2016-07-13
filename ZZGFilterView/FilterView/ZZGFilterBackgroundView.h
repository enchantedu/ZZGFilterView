//
//  ZZGFilterBackgroundView.h
//  ZZGFilterView
//
//  Created by dito on 16/7/13.
//  Copyright © 2016年 zouzhigang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZGFilterBackgroundView : UIView

- (instancetype)initWithMainCategories:(NSArray *)mainCategories subCategories:(NSArray *)subCategories;

- (void)showInKeyWindow;
- (void)hideInKeyWindow;

@end
