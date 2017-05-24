//
//  CircleLayout.h
//  UICollectionViewDemo
//
//  Created by sky on 2017/5/24.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleLayout : UICollectionViewLayout

/* 中心点 */
@property (nonatomic, assign) CGPoint center;
/* 半径 */
@property (nonatomic, assign) CGFloat radius;
/* item个数 */
@property (nonatomic, assign) NSInteger cellCount;

@end
