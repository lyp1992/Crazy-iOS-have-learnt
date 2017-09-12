//
//  YPFlowlayout.m
//  中间放大CollectionView
//
//  Created by navchina on 2017/9/12.
//  Copyright © 2017年 laiyongpeng. All rights reserved.
//

#import "YPFlowlayout.h"
#define Active_distance 200
#define ZOOM_factor 0.5
@implementation YPFlowlayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        //设置每一个item的大小
        self.itemSize = CGSizeMake(160, 300);
//        设置滚动方向
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//        设置各分区上下左右保留的空白区大小
        self.sectionInset = UIEdgeInsetsMake(120, 30, 120, 30);
//        设置单元格之间的最小行间距
        self.minimumLineSpacing = 50;
    }
    return self;
}
//当bounce改变时，是否需要重新布局
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    
    return YES;
}
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
//    记录可视区域
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size = self.collectionView.frame.size;
    for (UICollectionViewLayoutAttributes *attributes in array) {

        CGFloat distance = CGRectGetMidX(visibleRect) - attributes.center.x;
        if (fabs(distance)<Active_distance) {
            CGFloat zoom = 1 + ZOOM_factor *(1-fabs(distance/Active_distance));
            attributes.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0);
            attributes.zIndex = 1;
        }
        
    }
    return array;
}
@end
