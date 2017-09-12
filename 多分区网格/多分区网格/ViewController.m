//
//  ViewController.m
//  多分区网格
//
//  Created by navchina on 2017/9/12.
//  Copyright © 2017年 laiyongpeng. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "FooterCollectionViewCell.h"
#import "HeaderCollectionViewCell.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSDictionary *books;
@property (nonatomic, strong) NSArray *authors;
@property (nonatomic, strong) NSDictionary *covers;
@property (nonatomic, strong) NSDictionary *headers;

@end

@implementation ViewController

static NSString *cellID = @"cellid";
static NSString *headerId = @"headerId";
static NSString *footerId = @"footerID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self yp_createData];
    [self createUI];
}

-(void)yp_createData{
    self.books = [NSDictionary dictionaryWithObjectsAndKeys:[NSArray arrayWithObjects:@"老来",@"你好",@"我们都好", nil],@"赖永鹏",[NSArray arrayWithObjects:@"故事",@"很棒",@"牛的不行", nil],@"乔家客", nil];
    self.authors = [[self.books allKeys]sortedArrayUsingSelector:@selector(compare:)];
    
    self.covers = [NSDictionary dictionaryWithObjectsAndKeys:@"猫",@"老来",@"狗",@"你好",@"狼",@"我们都好",@"兔子",@"故事",@"猪",@"很棒",@"狼",@"牛的不行", nil];
    self.headers = [NSDictionary dictionaryWithObjectsAndKeys:@"狼",@"赖永鹏",@"狗",@"乔家客", nil];
}

-(void)createUI{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(160, 200);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    UICollectionView *collectionV = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flowLayout];
    [collectionV registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:cellID];
    [collectionV registerClass:[HeaderCollectionViewCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId];
    [collectionV registerClass:[FooterCollectionViewCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerId];
    collectionV.delegate = self;
    collectionV.dataSource = self;
    collectionV.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:collectionV];
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return self.authors.count;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //取作者
    NSString *autor = [self.authors objectAtIndex:section];
    return [[self.books objectForKey:autor] count];
}

//该方法返回指定分区的页眉和页脚
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    为表格行定义一个静态字符串作为标识符

    NSString *autor = [self.authors objectAtIndex:indexPath.section];
    UICollectionReusableView *view;
    if (kind == UICollectionElementKindSectionHeader) {
        //从可重用的队列中取出一个view
        view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerId forIndexPath:indexPath];
        UIImageView *iv = (UIImageView *)[view viewWithTag:1];
        iv.image = [UIImage imageNamed:[self.headers objectForKey:autor]];
    }
    if (kind == UICollectionElementKindSectionFooter) {
        
        view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footerId forIndexPath:indexPath];
        UILabel *label = (UILabel *)[view viewWithTag:1];
        label.text = [NSString stringWithFormat:@"%@一共有 %u本书",autor,[[self.books objectForKey:autor]count]];
    }
    return view;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.layer.cornerRadius = 8.0;
    cell.layer.masksToBounds = YES;
//    获取该分区的作者
    NSString *author = [self.authors objectAtIndex:indexPath.section];
    NSString *book = [[self.books objectForKey:author] objectAtIndex:indexPath.row];
    UIImageView *iv = (UIImageView *)[cell viewWithTag:1];
    iv.image = [UIImage imageNamed:[self.covers objectForKey:book]];
    UILabel *label = (UILabel *) [cell viewWithTag:2];
    label.text = [NSString stringWithFormat:@"%@",book];
    
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    return CGSizeMake(self.view.frame.size.width, 170);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    
    return CGSizeMake(self.view.frame.size.width, 100);
}
@end
