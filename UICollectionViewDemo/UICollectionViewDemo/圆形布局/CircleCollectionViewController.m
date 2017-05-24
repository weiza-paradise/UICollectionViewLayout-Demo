//
//  CircleCollectionViewController.m
//  UICollectionViewDemo
//
//  Created by sky on 2017/5/24.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "CircleCollectionViewController.h"
#import "CircleLayout.h"
#import "CollectionViewCell.h"

@interface CircleCollectionViewController ()
{
    NSInteger cellCount;
}
@end

@implementation CircleCollectionViewController

static NSString * const reuseIdentifier = @"CollectionViewCell";

- (instancetype)init
{
    CircleLayout *layout = [[CircleLayout alloc]init];
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    cellCount = 20 ;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.collectionView addGestureRecognizer:tapRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return cellCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    // Configure the cell
    return cell;
}

- (void)handleTapGesture:(UITapGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        /* 得到点击collection view 中的位置 */
        CGPoint initialPinchPoint = [sender locationInView:self.collectionView];
        /* 根据点击的Point,得到点击位置所在的indexPath */
        NSIndexPath* tappedCellPath = [self.collectionView indexPathForItemAtPoint:initialPinchPoint];
        /* 如果存在就删除 */
        if (tappedCellPath!=nil)
        {
            cellCount = cellCount - 1;
            [self.collectionView performBatchUpdates:^{
                [self.collectionView deleteItemsAtIndexPaths:[NSArray arrayWithObject:tappedCellPath]];
                
            } completion:nil];
        }
        else
        {
            /* 不存在就插入 */
            cellCount = cellCount + 1;
            [self.collectionView performBatchUpdates:^{
                [self.collectionView insertItemsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForItem:0 inSection:0]]];
            } completion:nil];
        }
    }
}

@end
