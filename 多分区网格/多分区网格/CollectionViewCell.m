//
//  CollectionViewCell.m
//  多分区网格
//
//  Created by navchina on 2017/9/12.
//  Copyright © 2017年 laiyongpeng. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageV = [[UIImageView alloc]init];
        imageV.frame = CGRectMake(0, 0, frame.size.width, frame.size.height - 30);
        imageV.tag = 1;
        [self.contentView addSubview:imageV];
        
        UILabel *label = [[UILabel alloc]init];
        label.frame = CGRectMake(0, CGRectGetMaxY(imageV.frame), frame.size.width, 30);
        label.tag = 2;
        label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:label];
    }
    return self;
}

@end
