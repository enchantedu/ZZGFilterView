//
//  ZZGFilterView.m
//  ZZGFilterView
//
//  Created by dito on 16/7/12.
//  Copyright © 2016年 zouzhigang. All rights reserved.
//

#import "ZZGFilterView.h"
#import "Masonry.h"
#import "ZZGCategoryBtnView.h"
#import "ZZGFilterConst.h"

@implementation ZZGFilterView {
    NSArray *_categoryBtnInfos;
    ZZGCategoryBtnView *_categoryBtnView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mainTableViewDidSelectRow:) name:kMainTableViewDidSelectRow object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(subTableViewDidSelectRow:) name:kSubTableViewDidSelectRow object:nil];
    }
    return self;
}

#pragma mark - Public Methods
- (void)refreshUI {
    ZZGCategoryBtnView *categoryBtnView = [[ZZGCategoryBtnView alloc] initWithInfos:_categoryBtnInfos];
    [self addSubview:categoryBtnView];
    
    [categoryBtnView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(categoryBtnView.superview);
    }];
}

- (void)showInSuperview {
    self.hidden = NO;
}

- (void)hideInSuperview {
    
}

- (void)hideBackgroundView {
}

#pragma mark - Action
- (void)mainTableViewDidSelectRow:(NSNotification *)noti {
    UITableView *tableView = noti.userInfo[kMainTableViewKey];
    NSIndexPath *indexPath = noti.userInfo[kMainTableViewIndexPathKey];
    NSArray *mainCategories = noti.userInfo[kMainCategories];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(filterView:mainTableView:didSelectAtIndexPath:)]) {
        [self.delegate filterView:self mainTableView:tableView didSelectAtIndexPath:indexPath];
        
        for (NSDictionary *dict in _categoryBtnInfos) {
            if ([dict[kMainCategories] isEqualToArray:mainCategories]) {
                NSArray *aSubCategories = dict[kAllSubCategories];
                if (!aSubCategories) {
                    [self hideInSuperview];
                }
            }
        }
    }
    
    
}

- (void)subTableViewDidSelectRow:(NSNotification *)noti {
    UITableView *tableView = noti.userInfo[kSubTableViewKey];
    NSIndexPath *indexPath = noti.userInfo[kSubTableViewIndexPathKey];
    if (self.delegate && [self.delegate respondsToSelector:@selector(filterView:subTableView:didSelectAtIndexPath:)]) {
        [self.delegate filterView:self subTableView:tableView didSelectAtIndexPath:indexPath];
        [self hideBackgroundView];
    }
    
}





- (void)setDelegate:(id<ZZGFilterViewDelegate>)delegate {
    _categoryBtnInfos = [delegate infosForCategoryBtnItems];
}
















@end
