//
//  ZZGFilterConst.h
//  ZZGFilterView
//
//  Created by dito on 16/7/13.
//  Copyright © 2016年 zouzhigang. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kTitle;
extern NSString * const kMainCategories;
extern NSString * const kAllSubCategories;

/** 分界线颜色 */
#define kDivideColor [UIColor colorWithRed:(200 / 255.0) green:(200 / 255.0) blue:(200 / 255.0) alpha:1.0]

/** WideSelectionView从父视图移除后发出的通知名称 */
extern NSString * const kWideOptionViewDidHideInKeyWindow;
/** 主分类tableview的row被点击后发出的通知名称 */
extern NSString * const kMainTableViewDidSelectRow;
/** 次分类tableview的row被点击后发出的通知名称 */
extern NSString * const kSubTableViewDidSelectRow;

/** 主分类tableview被点击的indexPath的key */
extern NSString * const kMainTableViewIndexPathKey;
/** 主分类tableview的key */
extern NSString * const kMainTableViewKey;
/** 次分类tableview被点击的indexPath的key */
extern NSString * const kSubTableViewIndexPathKey;
/** 次分类tableview的key */
extern NSString * const kSubTableViewKey;