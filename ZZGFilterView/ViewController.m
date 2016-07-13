//
//  ViewController.m
//  ZZGFilterView
//
//  Created by dito on 16/7/11.
//  Copyright © 2016年 zouzhigang. All rights reserved.
//

#import "ViewController.h"
#import "ZZGFilterView.h"
#import "Masonry.h"
#import "ZZGFilterConst.h"

@interface ViewController () <ZZGFilterViewDelegate>

@end

@implementation ViewController {
    ZZGFilterView *_filterView;

}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)loadView {
    [super loadView];
    
    _filterView = [[ZZGFilterView alloc] init];
    _filterView.delegate = self;
    [self.view addSubview:_filterView];
    
    [self updateViewConstraints];
}

- (void)updateViewConstraints {
    [_filterView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.left.right.equalTo(self.view);
        make.height.mas_offset(60);
    }];
    
    [super updateViewConstraints];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - ZZGFilterViewDelegate
- (NSArray *)infosForCategoryBtnItems {
    NSMutableArray *arrayM = [NSMutableArray array];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[kTitle] = @"Btn1";
    dict[kMainCategories] = @[@"main1", @"main2", @"main3", @"main4", @"main5"];
    [arrayM addObject:dict];
    
    return arrayM.copy;
}





@end
