//
//  ViewController.m
//  自定义转场动画
//
//  Created by navchina on 2017/9/5.
//  Copyright © 2017年 laiyongpeng. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "CustomPresentAnimationVC.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(self.view.bounds.size.width/2 - 50, self.view.center.y - 25, 100, 50);
    [button setTitle:@"第一个控制器" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(tiaozhuan:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%s",__func__);
}

-(void)viewDidDisappear:(BOOL)animated{

    [super viewDidDisappear:animated];
     NSLog(@"%s",__func__);
}

-(void)tiaozhuan:(UIButton *)sender{
   
    SecondViewController *secVC = [[SecondViewController alloc]init];
    secVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    secVC.transitioningDelegate = self;
    
    [self presentViewController:secVC animated:YES completion:nil];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{

    CustomPresentAnimationVC *cusPresenVC = [CustomPresentAnimationVC new];
    cusPresenVC.isDismiss = NO;
    return cusPresenVC;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{

    CustomPresentAnimationVC *cusPresenVC = [CustomPresentAnimationVC new];
    cusPresenVC.isDismiss = YES;
    return cusPresenVC;
}


@end
