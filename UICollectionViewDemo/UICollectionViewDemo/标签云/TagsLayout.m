//
//  TagsLayout.m
//  UICollectionViewDemo
//
//  Created by sky on 2017/5/26.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "TagsLayout.h"

@interface TagsLayout ()
{
    CGFloat xOffset ;  //x轴
    CGFloat yOffset ;  //y轴
    CGFloat nextOffset;//下一个item的x

}
@property (nonatomic, strong) NSMutableArray *itemAttributes;
@property (nonatomic, assign) CGFloat contentHeight;
/* item个数 */
@property (nonatomic, assign) NSInteger cellCount;

@end

@implementation TagsLayout

- (id)init
{
    if (self = [super init]) {
        /** 默认值 */
        self.minimumInteritemSpacing = 5;
        self.minimumLineSpacing      = 5;
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    }
    return self;
}

- (void)prepareLayout
{
    [super prepareLayout];
    NSLog(@"prepareLayout");
    _contentHeight = 0 ;
    //只拿第一组
    _cellCount = [self.collectionView numberOfItemsInSection:0];
    xOffset    = self.sectionInset.left;
    yOffset    = self.sectionInset.top;
    nextOffset = self.sectionInset.left;

    if (_itemAttributes) {
        [_itemAttributes removeAllObjects];
    }
    _itemAttributes = [NSMutableArray arrayWithCapacity:_cellCount];
    
    /* 得到所有item的属性信息 */
    for (NSInteger i=0; i < _cellCount; i++) {
        [_itemAttributes addObject:[self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]]];
    }
}


- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [super layoutAttributesForItemAtIndexPath:indexPath];
    /** 得到item的size */
    CGSize itemSize = [self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
    /** 得到下一个item的x */
    nextOffset += (self.minimumInteritemSpacing + itemSize.width);
    
    /** 换行 */
    //当x轴减去item行间距大于 collection width - 内容右边距的时候换行,否则继续排列
    if (nextOffset - self.minimumInteritemSpacing  > self.collectionView.bounds.size.width - self.sectionInset.right)
    {
        xOffset = self.sectionInset.left;
        nextOffset = (self.sectionInset.left + self.minimumInteritemSpacing + itemSize.width);
        yOffset += (itemSize.height + self.minimumLineSpacing);
    }else{
        xOffset = nextOffset - (self.minimumInteritemSpacing + itemSize.width);
    }
    attributes.frame = CGRectMake(xOffset, yOffset, itemSize.width, itemSize.height);
    
    /** 计算出collectionview 的可滑动高度(全屏就省略) */
    _contentHeight = MAX(_contentHeight, CGRectGetMaxY(attributes.frame));
    if (_cellCount == indexPath.item + 1) {
        _contentHeight += self.sectionInset.bottom;
    }
    return attributes;
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return (_itemAttributes.count > 0) ? _itemAttributes : [super layoutAttributesForElementsInRect:rect];
}

- (CGSize)collectionViewContentSize {
    /** 可滑动 */
    return [self collectionView].frame.size;
    /** 不可滑动就用算的高度 */
    //return CGSizeMake(self.collectionView.frame.size.width, _contentHeight);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    CGRect oldBounds = self.collectionView.bounds;
    if (!CGSizeEqualToSize(oldBounds.size, newBounds.size)) {
        return YES;
    }
    return NO;
}

@end
