//
//  HorizontalScrollLayout.m
//  UICollectionViewDemo
//
//  Created by sky on 2017/5/25.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "HorizontalScrollLayout.h"

UIKIT_EXTERN NSUInteger numberOfPages(NSUInteger itemsInPage, NSUInteger totalCount) {
    if (totalCount == 0) return 0;
    return (totalCount > itemsInPage) ? ((totalCount - 1) / itemsInPage + 1) : 1;
}

@interface HorizontalScrollLayout ()
{
    /* 显示页数 */
    NSUInteger _numberOfPages;
}
/* item的属性数组 */
@property (nonatomic, strong) NSMutableArray<UICollectionViewLayoutAttributes*> *itemsAttributes;

@end

@implementation HorizontalScrollLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self _setUp];
    }
    return self;
}

- (void)_setUp
{
    /* 水平滑动 */
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    /* 初始化数据 */
    _numberOfItemsInPage = 0 ;
    _columnsInPage = 0 ;
    _numberOfPages = 0 ;
    _pageInset = UIEdgeInsetsZero;
}

- (void)prepareLayout
{
    [super prepareLayout];
    
    [self.itemsAttributes removeAllObjects];
    /* 每页配置参数为0，则直接使用系统默认 */
    if (_numberOfItemsInPage == 0 || _columnsInPage == 0 ) {
        return;
    }
    
    /* 一共有多少item */
    NSInteger numbers = [self.collectionView numberOfItemsInSection:0];
    /* 求显示几页 */
    _numberOfPages = numberOfPages(_numberOfItemsInPage, numbers);
    /* 得到所有item的属性信息 */
    for (NSInteger i=0; i < numbers; i++) {
        [self.itemsAttributes addObject:[self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]]];
    }
}

/* 返回所有item的属性信息 */
- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return (self.itemsAttributes.count > 0) ? self.itemsAttributes : [super layoutAttributesForElementsInRect:rect];
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [super layoutAttributesForItemAtIndexPath:indexPath];
    /* 第几页 */
    NSUInteger curPage = indexPath.row / self.numberOfItemsInPage;
    // 当前cell所在当页的index
    NSUInteger curIndex = indexPath.row - curPage * self.numberOfItemsInPage;
    // 当前cell所在当页的行
    NSUInteger curColumn = curIndex % self.columnsInPage;
    // 当前cell所在当页的列
    NSUInteger curRow = curIndex / self.columnsInPage;
    // 调整attributes（大小不变，位置改变）
    CGRect rect = attributes.frame;
    CGFloat point_x = self.collectionView.bounds.size.width * curPage + self.pageInset.left + curColumn * self.itemSize.width + curColumn * self.minimumLineSpacing;
    CGFloat point_y = self.pageInset.top + curRow * self.itemSize.height + curRow * self.minimumInteritemSpacing;
    attributes.frame = CGRectMake(point_x,  point_y, rect.size.width, rect.size.height);
    return attributes;

    
    return attributes;
}

- (CGSize)collectionViewContentSize {
    return CGSizeMake(self.collectionView.bounds.size.width * _numberOfPages, [super collectionViewContentSize].height);
}

#pragma mark - lazy

- (NSMutableArray*)itemsAttributes
{
    if (!_itemsAttributes) {
        _itemsAttributes = [NSMutableArray array];
    }
    return _itemsAttributes;
}

@end
