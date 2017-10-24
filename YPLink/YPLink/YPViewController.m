//
//  ViewController.m
//  YPLink
//
//  Created by navchina on 2017/10/24.
//  Copyright © 2017年 laiyongpeng. All rights reserved.
//

#import "YPViewController.h"

@interface YPViewController ()
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


@end

@implementation YPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    加载背景，设置UI
    UIColor *color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"room.jpg"]];
    self.view.backgroundColor = color;
    self.timeLabel.textColor = [UIColor colorWithRed:1 green:1
                                               blue: 9/15 alpha:1];
    // 为startBn按钮设置图片
    [self.startButton setBackgroundImage:[UIImage imageNamed:@"start.png"]
                            forState:UIControlStateNormal];
    [self.startButton setBackgroundImage:[UIImage imageNamed:@"start_down.png"]
                            forState:UIControlStateHighlighted];
    // 为startBn的Touch Up Inside事件绑定事件处理方法
    [self.startButton addTarget:self action:@selector(startGame)
           forControlEvents:UIControlEventTouchUpInside];

//    创建游戏界面
    
}

-(void)startGame{

    
}

@end
