//
//  ViewController.m
//  自定义UIStepper
//
//  Created by navchina on 2017/9/8.
//  Copyright © 2017年 laiyongpeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIStepper *stepper = [[UIStepper alloc]init];
    stepper.minimumValue = 0;
    stepper.maximumValue = 10;
    stepper.stepValue = 1;
    stepper.value = 1;
    stepper.center = CGPointMake(160, 240);
//    [stepper setDividerImage:[UIImage imageNamed:@"狗"] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal];
    [stepper addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:stepper];
    
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(100, 100, 100, 50);
    [self.view addSubview:label];
    label.text = [NSString stringWithFormat:@"%.f",stepper.value];
    self.label = label;
}

-(void)changeValue:(UIStepper *)step{
    
    self.label.text = [NSString stringWithFormat:@"%.f",step.value];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
