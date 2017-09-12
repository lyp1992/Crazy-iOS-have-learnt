//
//  HeaderCollectionViewCell.m
//  多分区网格
//
//  Created by navchina on 2017/9/12.
//  Copyright © 2017年 laiyongpeng. All rights reserved.
//

#import "HeaderCollectionViewCell.h"

@implementation HeaderCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageV = [[UIImageView alloc]init];
        imageV.frame = CGRectMake(0, 0, frame.size.width, frame.size.height );
        imageV.tag = 1;
        [self addSubview:imageV];
    }
    return self;
}
@end
