//
//  RadioCell.m
//  UICollectionViewDemo
//
//  Created by wei on 2017/6/1.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "RadioCell.h"

@implementation RadioCell

- (IBAction)selectButton:(id)sender {
    
    if (self.ClickImageButton) {
        self.ClickImageButton();
    }
    
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
