//
//  ZZGSubCategoryView.m
//  ZZGFilterView
//
//  Created by dito on 16/7/12.
//  Copyright © 2016年 zouzhigang. All rights reserved.
//

#import "ZZGSubCategoryView.h"
#import "Masonry.h"
#import "ZZGFilterConst.h"

@interface ZZGSubCategoryView () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ZZGSubCategoryView {
    UITableView *_tableView;
    NSArray *_allSubCategories;
    NSArray *_aSubCategories;
}

- (instancetype)initWithCategories:(NSArray *)categories {
    self = [super init];
    if (self) {
        _allSubCategories = categories;
        _aSubCategories = _aSubCategories[0];
        [self setupViews];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTableView:) name:kMainTableViewDidSelectRow object:nil];
    }
    return self;
}

- (void)setupViews {
    _tableView = [[UITableView alloc] init];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self addSubview:_tableView];
    
    [_tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_tableView.superview);
    }];
}

#pragma mark - UITableViewDataSoure
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _aSubCategories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _aSubCategories[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[kSubTableViewIndexPathKey] = indexPath;
    dict[kSubTableViewKey] = tableView;
    [[NSNotificationCenter defaultCenter] postNotificationName:kSubTableViewDidSelectRow object:nil userInfo:dict];
}

#pragma mark - Action
- (void)reloadTableView:(NSNotification *)noti {
    NSIndexPath *indexPath = noti.userInfo[kMainTableViewIndexPathKey];
    _aSubCategories = _allSubCategories[indexPath.row];
    [_tableView reloadData];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



@end
