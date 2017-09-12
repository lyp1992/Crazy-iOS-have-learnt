//
//  ViewController.m
//  环形布局UICollectiongView
//
//  Created by navchina on 2017/9/12.
//  Copyright © 2017年 laiyongpeng. All rights reserved.
//

#import "ViewController.h"
#import "YPCircleLayout.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, assign) NSInteger cellCount;

@property (nonatomic, strong) UICollectionView *collectionV;
@end

@implementation ViewController

static NSString *cellId = @"cellID";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cellCount = 16;
//    创建一个uicollectionview
    YPCircleLayout *circleLayout = [[YPCircleLayout alloc]init];
    UICollectionView *collectionV = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:circleLayout];

    collectionV.backgroundColor = [UIColor grayColor];
    [collectionV registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellId];
    collectionV.dataSource = self;
    collectionV.delegate = self;
    
    //添加点击事件
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapCollectionCell:)];
    [collectionV addGestureRecognizer:tapGesture];
    
    [self.view addSubview:collectionV];
    self.collectionV = collectionV;
    
}

#pragma mark --private
-(void)tapCollectionCell:(UITapGestureRecognizer *)gesture{
    if (gesture.state == UIGestureRecognizerStateEnded) {
        //获取点击的位置
        CGPoint initialPinchPoint = [gesture locationInView:self.collectionV];
        //获取点击单元格的位置
        NSIndexPath *tapIndexPath = [self.collectionV indexPathForItemAtPoint:initialPinchPoint];
        if (tapIndexPath) {//如果存在,则删除
            _cellCount --;
            [self.collectionV deleteItemsAtIndexPaths:@[tapIndexPath]];
        }else{
            _cellCount ++;
            [self.collectionV insertItemsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForItem:0 inSection:0]]];
            
        }
    }
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.cellCount;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.backgroundColor = [UIColor lightGrayColor];
    return cell;
}


@end
