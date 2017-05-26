//
//  TagsCell.m
//  UICollectionViewDemo
//
//  Created by sky on 2017/5/26.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "TagsCell.h"

@implementation TagsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.contentView.layer.borderWidth = 0.65;
    // Initialization code
}

@end
