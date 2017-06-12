//
//  RadioCell.h
//  UICollectionViewDemo
//
//  Created by wei on 2017/6/1.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RadioCell : UICollectionViewCell

@property (nonatomic , copy) void (^ClickImageButton)() ;

@property (weak, nonatomic) IBOutlet UIButton *imageButton;

@end
