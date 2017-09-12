//
//  CollectionViewCell.m
//  中间放大CollectionView
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
        
        UIImageView *imgV = [[UIImageView alloc]init];
        imgV.image = [UIImage imageNamed:@"狼"];
        imgV.frame = CGRectMake(0, 0, 160, 240);
        [self.contentView addSubview:imgV];
        
        UILabel *label = [[UILabel alloc]init];
        label.frame = CGRectMake(0, CGRectGetMaxY(imgV.frame), frame.size.width, 60);
        label.font = [UIFont systemFontOfSize:50];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"你好";
        [self.contentView addSubview:label];
        self.contentView.layer.borderWidth = 2.0f;
        self.contentView.layer.borderColor = [UIColor redColor].CGColor;
        self.layer.cornerRadius = 8.0;
    }
    return self;
}

@end
