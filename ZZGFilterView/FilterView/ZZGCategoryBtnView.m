//
//  ZZGCategoryBtnView.m
//  ZZGFilterView
//
//  Created by dito on 16/7/12.
//  Copyright © 2016年 zouzhigang. All rights reserved.
//

#import "ZZGCategoryBtnView.h"
#import "ZZGFilterButton.h"
#import "ZZGFilterBackgroundView.h"
#import "Masonry.h"
#import "ZZGFilterConst.h"

@implementation ZZGCategoryBtnView {
    ZZGFilterButton *_currentButton;
    ZZGFilterBackgroundView *_currentBackgroundView;
    NSMutableDictionary  *_backgroundViewsDict;
}

- (instancetype)initWithInfos:(NSArray *)infos {
    self = [super init];
    if (self) {
        _backgroundViewsDict = [NSMutableDictionary dictionary];
        [self setupViewsWithInfos:infos];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backgroundViewDidHideInSuperView) name:kWideOptionViewDidHideInKeyWindow object:nil];
    }
    return self;
}

- (void)setupViewsWithInfos:(NSArray *)infos {
    if (infos.count == 0 || infos.count > 4)
        return;
    
    NSUInteger count = infos.count;
    switch (count) {
        case 1: {
            NSDictionary *firstDict = infos[0];
            ZZGFilterButton *firstButton = [self addButtonWith:firstDict normalImageName:@"down_arrow" selectedImageName:@"up_arrow"];
            
            [firstButton mas_makeConstraints:^(MASConstraintMaker *make){
                make.edges.equalTo(firstButton.superview);
            }];
            
        }
            break;
            
        case 2: {
            NSDictionary *firstDict = infos[0];
            NSDictionary *secondDict = infos[1];
            
            ZZGFilterButton *firstButton = [self addButtonWith:firstDict normalImageName:@"down_arrow" selectedImageName:@"up_arrow"];
            ZZGFilterButton *secondButton = [self addButtonWith:secondDict normalImageName:@"down_arrow" selectedImageName:@"up_arrow"];
            UIView *verticalLine = [[UIView alloc] init];
            verticalLine.backgroundColor = [UIColor redColor];
            [self addSubview:verticalLine];
            
            
            [firstButton mas_makeConstraints:^(MASConstraintMaker *make){
                make.top.bottom.left.equalTo(firstButton.superview);
                make.width.equalTo(secondButton);
            }];
            
            [verticalLine mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(0.5);
                make.top.equalTo(verticalLine.superview).offset(10);
                make.bottom.equalTo(verticalLine.superview).offset(-10);
                make.left.equalTo(firstButton.mas_right);
            }];
            
            [secondButton mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(verticalLine.mas_right);
                make.top.bottom.right.equalTo(secondButton.superview);
            }];
            
        }
            break;
            
        case 3: {
            NSDictionary *firstDict = infos[0];
            NSDictionary *secondDict = infos[1];
            NSDictionary *thirdDict = infos[2];
            
            ZZGFilterButton *firstButton = [self addButtonWith:firstDict normalImageName:@"down_arrow" selectedImageName:@"up_arrow"];
            ZZGFilterButton *secondButton = [self addButtonWith:secondDict normalImageName:@"down_arrow" selectedImageName:@"up_arrow"];
            ZZGFilterButton *thirdButton = [self addButtonWith:thirdDict normalImageName:@"down_arrow" selectedImageName:@"up_arrow"];
            
            UIView *firstVerticalLine = [[UIView alloc] init];
            firstVerticalLine.backgroundColor = [UIColor redColor];
            [self addSubview:firstVerticalLine];
            
            UIView *secondVerticalLine = [[UIView alloc] init];
            secondVerticalLine.backgroundColor = [UIColor redColor];
            [self addSubview:secondVerticalLine];
            
            [firstButton mas_makeConstraints:^(MASConstraintMaker *make){
                make.top.bottom.left.equalTo(firstButton.superview);
                make.width.equalTo(secondButton);
            }];
            
            [firstVerticalLine mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(0.5);
                make.top.equalTo(firstVerticalLine.superview).offset(10);
                make.bottom.equalTo(firstVerticalLine.superview).offset(-10);
                make.left.equalTo(firstButton.mas_right);
            }];
            
            [secondButton mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(secondButton.superview);
                make.left.equalTo(firstVerticalLine.mas_right);
                make.width.equalTo(thirdButton);
            }];
            
            [secondVerticalLine mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(0.5);
                make.top.equalTo(secondVerticalLine.superview).offset(10);
                make.bottom.equalTo(secondVerticalLine.superview).offset(-10);
                make.left.equalTo(secondButton.mas_right);
            }];
            
            [thirdButton mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.right.equalTo(thirdButton.superview);
                make.left.equalTo(secondVerticalLine.mas_right);
            }];
            
        }
            break;
            
        case 4: {
            
        }
            break;
            
        default:
            break;
    }
}

- (ZZGFilterButton *)addButtonWith:(NSDictionary *)dict normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName {
    ZZGFilterButton *button = [[ZZGFilterButton alloc] initWithDict:dict normalImageNamed:normalImageName selectedImageNamed:selectedImageName];
    [button addTarget:self action:@selector(didButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    return button;
}

#pragma mark - Action
- (void)didButtonClicked:(ZZGFilterButton *)button {
    if (_currentButton != button) {
        _currentButton.selected = NO;
        _currentButton = button;
        [_currentBackgroundView hideInKeyWindow];
    }
    
    button.selected = !button.selected;
    
    if (button.isSelected) {
        _currentBackgroundView = _backgroundViewsDict[button.titleLabel.text];
        if (!_currentBackgroundView) {
            _currentBackgroundView = [self addBackgroundViewWithFilterButton:button];
            _backgroundViewsDict[button.titleLabel.text] = _currentBackgroundView;
        } else {
            [_currentBackgroundView showInKeyWindow];
        }
    } else {
        [_currentBackgroundView hideInKeyWindow];
    }
}


- (ZZGFilterBackgroundView *)addBackgroundViewWithFilterButton:(ZZGFilterButton *)filterButton {
    ZZGFilterBackgroundView *backgroundView = [[ZZGFilterBackgroundView alloc] initWithMainCategories:filterButton.dict[kMainCategories] subCategories:filterButton.dict[kAllSubCategories]];
    [[UIApplication sharedApplication].keyWindow addSubview:backgroundView];
    
    [backgroundView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backgroundView.superview).offset(64 + 44);
        make.left.right.equalTo(backgroundView.superview);
        make.baseline.equalTo(backgroundView.superview);
    }];
    [backgroundView showInKeyWindow];
    
    return backgroundView;
}


#pragma mark - Action
- (void)backgroundViewDidHideInSuperView {
    _currentButton.selected = NO;
}

#pragma mark - Public Methods
- (void)hideBackgroundView {
    [_currentBackgroundView hideInKeyWindow];
    _currentButton.selected = NO;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



@end
