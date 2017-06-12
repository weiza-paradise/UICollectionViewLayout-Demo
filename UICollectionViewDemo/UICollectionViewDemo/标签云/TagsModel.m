//
//  TagsModel.m
//  UICollectionViewDemo
//
//  Created by sky on 2017/5/26.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "TagsModel.h"
#import <YYModel/YYModel.h>

@implementation TagsModel

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    /** 数据初始化的时候算好宽度 */
    [self calculateContentSize];
    return YES;
}

- (void)calculateContentSize {
    //字体大小写死
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:15.f]};
    CGSize textSize = [_name boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 1000)
                                          options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    _contentSize = CGSizeMake(ceil(textSize.width), ceil(textSize.height));
}


@end
