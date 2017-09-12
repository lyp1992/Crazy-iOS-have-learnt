//
//  ViewController.m
//  自定义UIswitch
//
//  Created by navchina on 2017/9/8.
//  Copyright © 2017年 laiyongpeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISwitch *mySwitch = [[UISwitch alloc]init];
    mySwitch.frame = CGRectMake(100, 100, mySwitch.frame.size.width, mySwitch.frame.size.height);

    CGFloat scalex = 3;
    mySwitch.transform = CGAffineTransformMakeScale(scalex,scalex);
    mySwitch.layer.anchorPoint = CGPointMake(0.5/scalex,0.5/scalex);
    mySwitch.tintColor = [UIColor grayColor];
    mySwitch.onTintColor = [UIColor blueColor];
    mySwitch.backgroundColor = [UIColor lightGrayColor];
    mySwitch.thumbTintColor = [UIColor greenColor];
    mySwitch.layer.masksToBounds = YES;
    mySwitch.layer.cornerRadius = mySwitch.frame.size.height/(scalex *2);
    [self.view addSubview:mySwitch];
    NSLog(@"%@ %f",NSStringFromCGRect(mySwitch.frame),mySwitch.frame.size.height/(scalex *2));
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
