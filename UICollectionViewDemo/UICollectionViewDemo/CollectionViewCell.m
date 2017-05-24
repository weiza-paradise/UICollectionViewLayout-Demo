//
//  CollectionViewCell.m
//  UICollectionViewDemo
//
//  Created by sky on 2017/5/24.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "CollectionViewCell.h"

#define RANDOMCOLOR     [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1]

@implementation CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _myImageView.backgroundColor = RANDOMCOLOR;
    // Initialization code
}

@end
