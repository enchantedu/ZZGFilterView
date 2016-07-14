//
//  ZZGTwoTabsView.m
//  ZZGFilterView
//
//  Created by dito on 16/7/14.
//  Copyright © 2016年 zouzhigang. All rights reserved.
//

#import "ZZGTwoTabsView.h"
#import "ZZGMainCategoryView.h"
#import "ZZGSubCategoryView.h"
#import "Masonry.h"
#import "ZZGFilterConst.h"

@implementation ZZGTwoTabsView

- (instancetype)initWithMainCategories:(NSArray *)mainCategories subCategories:(NSArray *)subCategories {
    self = [super init];
    if (self) {
        [self setupViewsWithMainCategories:mainCategories subCategories:subCategories];
    }
    return self;
}

- (void)setupViewsWithMainCategories:(NSArray *)mainCategories subCategories:(NSArray *)subCategories {
    ZZGMainCategoryView *mainCategoryView = [[ZZGMainCategoryView alloc] initWithCategories:mainCategories];
    [self addSubview:mainCategoryView];
    
    ZZGSubCategoryView *subCategoryView = [[ZZGSubCategoryView alloc] initWithCategories:subCategories];
    [self addSubview:subCategoryView];
    
    [mainCategoryView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(mainCategoryView.superview);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width * 0.3);
    }];
    
    [subCategoryView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(subCategoryView.superview);
        make.left.equalTo(mainCategoryView.mas_right);
    }];
    
}



@end
