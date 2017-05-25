//
//  HorizontalScrollCell.h
//  UICollectionViewDemo
//
//  Created by sky on 2017/5/25.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YYImage/YYImage.h>


@interface HorizontalScrollCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet YYAnimatedImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end
