//
//  ViewController.m
//  中间放大CollectionView
//
//  Created by navchina on 2017/9/12.
//  Copyright © 2017年 laiyongpeng. All rights reserved.
//

#import "ViewController.h"
#import "YPFlowlayout.h"
#import "CollectionViewCell.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation ViewController

static NSString *cellID = @"Cellid";

- (void)viewDidLoad {
    [super viewDidLoad];
  
    YPFlowlayout *flowLayout = [[YPFlowlayout alloc]init];
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flowLayout];
    [collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:cellID];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:collectionView];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    return cell;
    
}

@end
