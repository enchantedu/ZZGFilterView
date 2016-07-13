//
//  ZZGFilterView.h
//  ZZGFilterView
//
//  Created by dito on 16/7/12.
//  Copyright © 2016年 zouzhigang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZZGFilterView;

@protocol ZZGFilterViewDelegate <NSObject>

@required
- (NSArray *)infosForCategoryBtnItems;

@optional
- (void)filterView:(ZZGFilterView *)fiterView mainTableView:(UITableView *)tableView didSelectAtIndexPath:(NSIndexPath *)indexPath;

- (void)filterView:(ZZGFilterView *)fiterView subTableView:(UITableView *)tableView didSelectAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface ZZGFilterView : UIView

@property (nonatomic, weak) id<ZZGFilterViewDelegate>delegate;


- (void)refreshUI;
- (void)showInSuperview;
- (void)hideInSuperview;
- (void)hideBackgroundView;



@end
