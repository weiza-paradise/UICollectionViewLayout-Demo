//
//  CircleLayout.m
//  UICollectionViewDemo
//
//  Created by sky on 2017/5/24.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "CircleLayout.h"

#define ITEM_SIZE 70

@interface CircleLayout ()

@property (nonatomic, strong) NSMutableArray *deleteIndexPaths;
@property (nonatomic, strong) NSMutableArray *insertIndexPaths;

@end


@implementation CircleLayout

/* 准备布局 */
-(void)prepareLayout
{
    [super prepareLayout];
    
    CGSize size = self.collectionView.frame.size;
    /* 得到item的个数 */
    _cellCount = [[self collectionView] numberOfItemsInSection:0];
    /* 得到collection view 中心点 */
    _center = CGPointMake(size.width / 2.0, size.height / 2.0);
    /* 得到半径 */
    _radius = MIN(size.width, size.height) / 2.5;
}


/* 返回collection view 的滑动距离 */
-(CGSize)collectionViewContentSize
{
    return [self collectionView].frame.size;
}


/* 返回指定indexPath的item的布局信息 */
- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    /* 设置item的size */
    attributes.size = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
    /* 设置item的中心点.根据半径*正弦和余弦分别得到y和x */
    attributes.center = CGPointMake(_center.x + _radius * cosf(2 * indexPath.item * M_PI / _cellCount),
                                    _center.y + _radius * sinf(2 * indexPath.item * M_PI / _cellCount));
    return attributes;
}

/* 返回所有的视图的UICollectionViewLayoutAttributes 包含time,追加视图和装饰视图 */
- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *attributes = [NSMutableArray array];
    for (int i = 0 ; i < _cellCount; i ++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    return attributes;
}

/** ----------------------以上一个圆形布局已经实现了,下面是点击删除和插入 -----------------------------------------  */




/* 通知collection view布局要更新.  */
- (void)prepareForCollectionViewUpdates:(NSArray<UICollectionViewUpdateItem *> *)updateItems
{
    [super prepareForCollectionViewUpdates:updateItems];
    
    self.deleteIndexPaths = [NSMutableArray array];
    self.insertIndexPaths = [NSMutableArray array];
    
    for (UICollectionViewUpdateItem *update in updateItems)
    {
        //是删除的放到删除数组
        if (update.updateAction == UICollectionUpdateActionDelete)
        {
            [self.deleteIndexPaths addObject:update.indexPathBeforeUpdate];
        }//插入放到插入数组
        else if (update.updateAction == UICollectionUpdateActionInsert)
        {
            [self.insertIndexPaths addObject:update.indexPathAfterUpdate];
        }
    }
}

/* 停止更新 */
- (void)finalizeCollectionViewUpdates
{
    [super finalizeCollectionViewUpdates];
    /* 释放俩数组 */
    self.deleteIndexPaths = nil;
    self.insertIndexPaths = nil;
}


/**
 返回一个Item插入到Collection View中开始的布局信息。
 这个方法在- (void)prepareForCollectionViewUpdates:(NSArray<UICollectionViewUpdateItem *> *)updateItems;方法后调用，在- (void)finalizeCollectionViewUpdates;方法之前调用，在任何一个Item被插入之前都会调用。
 */
- (nullable UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
   /* 一定要调用父类方法 */
   UICollectionViewLayoutAttributes *  attributes = [super initialLayoutAttributesForAppearingItemAtIndexPath:itemIndexPath];
    
    if ([self.insertIndexPaths containsObject:attributes]) {
        
        /* 改变插入单元格上的属性如果为nil先去得到 */
        if (!attributes) {
            attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
        }
        attributes.alpha = 0.f;
        attributes.center = CGPointMake(_center.x, _center.y);
    }
    
    return attributes;
}


/**
 返回一个Item从Collection View中被移除时的结束布局信息。
 这个方法在- (void)prepareForCollectionViewUpdates:(NSArray<UICollectionViewUpdateItem *> *)updateItems;方法后调用，在- (void)finalizeCollectionViewUpdates;方法之前调用，在任何一个Item被删除之前都会调用。
 */
- (nullable UICollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    /* 调用父类 */
    UICollectionViewLayoutAttributes *attributes = [super finalLayoutAttributesForDisappearingItemAtIndexPath:itemIndexPath];
    
    if ([self.deleteIndexPaths containsObject:attributes]) {
        if (!attributes) {
            attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
        }
        
        /* 配置属性 */
        attributes.alpha  = 0.f;
        attributes.center = CGPointMake(_center.x, _center.y);
        attributes.transform3D = CATransform3DMakeScale(0.1, 0.1, 1.0);
    }
    return attributes;
}

@end
