//
//  HorizontalScrollLayout.h
//  UICollectionViewDemo
//
//  Created by sky on 2017/5/25.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>

/* 求显示页数 */
UIKIT_EXTERN NSUInteger numberOfPages(NSUInteger itemsInPage, NSUInteger totalCount);

@interface HorizontalScrollLayout : UICollectionViewFlowLayout

/* 每页缩进 */
@property (nonatomic, assign) UIEdgeInsets pageInset;

/* 每页包含的数量 */
@property (nonatomic, assign) NSUInteger numberOfItemsInPage;

/* 每页多少列 */
@property (nonatomic, assign) NSUInteger columnsInPage;


@end
