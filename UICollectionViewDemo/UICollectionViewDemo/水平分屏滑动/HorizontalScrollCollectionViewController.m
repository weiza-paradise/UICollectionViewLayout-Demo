//
//  HorizontalScrollCollectionViewController.m
//  UICollectionViewDemo
//
//  Created by sky on 2017/5/25.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "HorizontalScrollCollectionViewController.h"
#import "HorizontalScrollCell.h"
#import "HorizontalScrollLayout.h"
#import <YYImage/YYImage.h>

@interface HorizontalScrollCollectionViewController ()

@end

@implementation HorizontalScrollCollectionViewController

static NSString * const reuseIdentifier = @"HorizontalScrollCell";

- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 2;
    layout.minimumInteritemSpacing = 2;
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"HorizontalScrollCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HorizontalScrollCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    int x = arc4random() % 20 + 1;
    YYImage * image = [YYImage imageNamed:[NSString stringWithFormat:@"%d.gif",x]];
    cell.imgView.image = image;
    return cell;
}


@end
