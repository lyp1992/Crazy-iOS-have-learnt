//
//  YPCircleLayout.m
//  环形布局UICollectiongView
//
//  Created by navchina on 2017/9/12.
//  Copyright © 2017年 laiyongpeng. All rights reserved.
//

#import "YPCircleLayout.h"
#define Item_size 72
@interface YPCircleLayout ()

@property (nonatomic, assign) NSInteger cellCount;
@property (nonatomic, assign) CGPoint center;
@property (nonatomic, assign) CGFloat radius;

@end

@implementation YPCircleLayout

//开始执行的方法
-(void)prepareLayout{
    [super prepareLayout];
    CGSize size = self.collectionView.frame.size;
    //计算单元格
    self.cellCount = [self.collectionView numberOfItemsInSection:0];
    //计算环的圆心
    self.center = CGPointMake(size.width/2.0, size.height/2.0);
    //计算环的半径
    self.radius = MIN(size.width, size.height)/2.5;
}
//该方法返回uicollectionView所包含的控件的大小
-(CGSize)collectionViewContentSize{
    
    return [self collectionView].frame.size;
}
//该方法返回UICollectionViewLayoutAttributes控制单元格的大小和位置
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    
//    创建UICollectionViewLayoutAttributes对象
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
//    设置个单元格的大小
    attributes.size = CGSizeMake(Item_size, Item_size);
//    设置单元格的中心坐标
    attributes.center = CGPointMake(self.center.x +self.radius * cosf(2*M_PI *indexPath.item / self.cellCount), self.center.y + self.radius * sinf(2*M_PI *indexPath.item / self.cellCount));
    return attributes;
}
//该方法返回UICollectionViewLayoutAttributes集合依次控制
//指定cgrect范围内单元格的大小和位置
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSMutableArray *attributes = [NSMutableArray array];
//    添加到array中
    for (int i = 0; i<self.cellCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    return attributes;
}
//单元格动态显示的时候调用
-(UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath{
    UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    attributes.alpha = 0;
    attributes.center = CGPointMake(self.center.x, self.center.y);
    return attributes;
}

//单元格消失的时候调用
-(UICollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath{
    UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    attributes.alpha = 0;
    attributes.center = CGPointMake(self.center.x, self.center.y);
    attributes.transform3D = CATransform3DMakeScale(0.1, 0.1, 1.0);
    return attributes;
}
@end
