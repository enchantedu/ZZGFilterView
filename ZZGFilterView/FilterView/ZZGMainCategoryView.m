//
//  ZZGMainCategoryView.m
//  ZZGFilterView
//
//  Created by dito on 16/7/12.
//  Copyright © 2016年 zouzhigang. All rights reserved.
//

#import "ZZGMainCategoryView.h"
#import "Masonry.h"
#import "ZZGFilterConst.h"

@interface ZZGMainCategoryView () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ZZGMainCategoryView {
    NSArray *_categories;
}

- (instancetype)initWithCategories:(NSArray *)categories {
    self = [super init];
    if (self) {
        _categories = categories;
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    UITableView *tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self addSubview:tableView];
    
    [tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(tableView.superview);
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _categories[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[kMainTableViewIndexPathKey] = indexPath;
    dict[kMainTableViewKey] = tableView;
    dict[kMainCategories] = _categories;
    [[NSNotificationCenter defaultCenter] postNotificationName:kMainTableViewDidSelectRow object:nil userInfo:dict];
}

@end
