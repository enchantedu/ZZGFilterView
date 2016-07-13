//
//  ZZGFilterBackgroundView.m
//  ZZGFilterView
//
//  Created by dito on 16/7/13.
//  Copyright © 2016年 zouzhigang. All rights reserved.
//

#import "ZZGFilterBackgroundView.h"
#import "Masonry.h"
#import "ZZGMainCategoryView.h"
#import "ZZGFilterConst.h"

@implementation ZZGFilterBackgroundView

- (instancetype)initWithMainCategories:(NSArray *)mainCategories subCategories:(NSArray *)subCategories {
    self = [super init];
    if (self) {
         self.backgroundColor = [UIColor colorWithRed:(150 / 255.0) green:(150 / 255.0) blue:(150 / 255.0) alpha:1.0];
        if (mainCategories && subCategories) {
            
        } else if (mainCategories && subCategories == nil) {
            [self setupViewsWithMainCategories:mainCategories];
        } else if (mainCategories == nil && subCategories) {
            [self setupViewsWithMainCategories:subCategories];
        }
    }
    return self;
}

- (void)setupViewsWithMainCategories:(NSArray *)mainCategories subCategories:(NSArray *)subCategories {
    
}

-(void)setupViewsWithMainCategories:(NSArray *)mainCategories {
    ZZGMainCategoryView *mainCategoryView = [[ZZGMainCategoryView alloc] initWithCategories:mainCategories];
    [self addSubview:mainCategoryView];
    
    [mainCategoryView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(mainCategoryView.superview);
        make.height.mas_equalTo([UIScreen mainScreen].bounds.size.height * 0.6);
    }];
}


#pragma mark - Public Methods
- (void)showInKeyWindow {
    CATransition *transition = [CATransition animation];
    transition.startProgress = 0.0;
    transition.endProgress = 1.0;
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromBottom;
    transition.duration = 0.25;
    
    [self.layer addAnimation:transition forKey:@"transition"];
    self.hidden = NO;
}

- (void)hideInKeyWindow {
    CABasicAnimation *fadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeAnimation.fromValue = @1.0;
    fadeAnimation.toValue = @0.0;
    fadeAnimation.duration = 0.25;
    [self.layer addAnimation:fadeAnimation forKey:@"opacity"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.14 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.hidden = YES;
    });
}

#pragma mark - Touch
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self hideInKeyWindow];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kWideOptionViewDidHideInKeyWindow object:nil];
}



















@end
