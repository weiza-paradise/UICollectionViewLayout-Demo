//
//  CardCollectionViewCell.h
//  UICollectionViewDemo
//
//  Created by sky on 2017/5/26.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YYImage/YYImage.h>

@interface CardCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet YYAnimatedImageView *gifImageView;

@end
