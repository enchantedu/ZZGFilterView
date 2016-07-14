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

@interface ViewController () <ZZGFilterViewDelegate, UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController {
    ZZGFilterView *_filterView;
    UITableView *_tableView;
    
    NSMutableArray *_dataArray;

}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _dataArray = [NSMutableArray array];
    }
    return self;
}

- (void)loadView {
    [super loadView];
    
    _filterView = [[ZZGFilterView alloc] init];
    _filterView.delegate = self;
    _filterView.backgroundColor = [UIColor greenColor];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [self updateViewConstraints];
}

- (void)updateViewConstraints {
    [_tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
    
    [super updateViewConstraints];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16",].mutableCopy;
    
    [_filterView refreshUI];
}

#pragma mark - ZZGFilterViewDelegate
- (NSArray *)infosForCategoryBtnItems {
    NSMutableArray *arrayM = [NSMutableArray array];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[kTitle] = @"Btn1";
    dict[kMainCategories] = @[@"main1", @"main2", @"main3", @"main4", @"main5", @"main6", @"main7", @"main8", @"main9", @"main10"];
    dict[kAllSubCategories] = @[@[@"1sub1", @"1sub2", @"1sub3"], @[@"2sub1", @"2sub3"], @[@"3sub1", @"3sub2"], @[@"4sub1", @"4sub2"], @[@"5sub1", @"5sub2"], @[@"6sub1", @"6sub2"], @[@"7sub1", @"7sub2"], @[@"8sub1", @"8sub2"], @[@"9sub1", @"9sub2"], @[@"10sub1", @"10sub2"]];
    [arrayM addObject:dict];
    
    NSMutableDictionary *dictTwo = [NSMutableDictionary dictionary];
    dictTwo[kTitle] = @"Btn2";
    dictTwo[kMainCategories] = @[@"2main1", @"2main2", @"2main3", @"2main4", @"2main5", @"2main6", @"2main7", @"2main8", @"2main9", @"2main10"];
    dictTwo[kAllSubCategories] = @[@[@"1sub1", @"1sub2", @"1sub3"], @[@"2sub1", @"2sub3"], @[@"3sub1", @"3sub2"], @[@"4sub1", @"4sub2"], @[@"5sub1", @"5sub2"], @[@"6sub1", @"6sub2"], @[@"7sub1", @"7sub2"], @[@"8sub1", @"8sub2"], @[@"9sub1", @"9sub2"], @[@"10sub1", @"10sub2"]];
    [arrayM addObject:dictTwo];
    
    NSMutableDictionary *dictThree = [NSMutableDictionary dictionary];
    dictThree[kTitle] = @"Btn3";
    dictThree[kMainCategories] = @[@"3main1", @"3main2", @"3main3", @"3main4", @"3main5", @"3main6", @"3main7", @"3main8", @"3main9", @"3main10"];
    dictThree[kAllSubCategories] = @[@[@"1sub1", @"1sub2", @"1sub3"], @[@"2sub1", @"2sub3"], @[@"3sub1", @"3sub2"], @[@"4sub1", @"4sub2"], @[@"5sub1", @"5sub2"], @[@"6sub1", @"6sub2"], @[@"7sub1", @"7sub2"], @[@"8sub1", @"8sub2"], @[@"9sub1", @"9sub2"], @[@"10sub1", @"10sub2"]];
    [arrayM addObject:dictThree];
    
    return arrayM.copy;
}

- (void)filterView:(ZZGFilterView *)fiterView mainTableView:(UITableView *)tableView didSelectAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 3 == 1) {
        _dataArray = @[@"2", @"4", @"6", @"8", @"10", @"12", @"14"].mutableCopy;
    } else if (indexPath.row % 3 == 2){
        _dataArray = @[@"1", @"3", @"5", @"7", @"9", @"11", @"13"].mutableCopy;
    } else {
        _dataArray = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16",].mutableCopy;
    }
    [_tableView reloadData];
}

- (void)filterView:(ZZGFilterView *)fiterView subTableView:(UITableView *)tableView didSelectAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
     }
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    return _filterView;
}


#pragma mark - UITableViewDelegate





@end
