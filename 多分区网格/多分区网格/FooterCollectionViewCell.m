//
//  FooterCollectionViewCell.m
//  多分区网格
//
//  Created by navchina on 2017/9/12.
//  Copyright © 2017年 laiyongpeng. All rights reserved.
//

#import "FooterCollectionViewCell.h"

@implementation FooterCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [[UILabel alloc]init];
        label.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        label.tag = 1;
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
    }
    return self;
}
@end
