//
//  CardCollectionViewCell.m
//  UICollectionViewDemo
//
//  Created by sky on 2017/5/26.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "CardCollectionViewCell.h"
#import "CommonMacro.h"

@implementation CardCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    /** 左右上方加圆角: 注意宽度和高度值 */
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, SCREEN_WIDTH-11, 110) byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(5, 5)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = CGRectMake(0, 0, SCREEN_WIDTH-11, 110);
    maskLayer.path  = maskPath.CGPath;
    _titleLabel.layer.mask = maskLayer;
}

@end
