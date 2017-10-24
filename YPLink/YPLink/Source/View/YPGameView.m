//
//  YPGameView.m
//  YPLink
//
//  Created by navchina on 2017/10/24.
//  Copyright © 2017年 laiyongpeng. All rights reserved.
//

#import "YPGameView.h"
#import <AudioToolbox/AudioToolbox.h>

@interface YPGameView ()

@end

@implementation YPGameView
{
    // 选中标识的图片对象
    UIImage* selectedImage;
    // 定义两个音效文件
    SystemSoundID gu;
    SystemSoundID dis;
    // 定义连接线的颜色
    UIColor* bubbleColor;
    
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
//        初始化代表选中框的图片
        selectedImage = [UIImage imageNamed:@"selected.png"];
//        获取两个音效文件的URL
        NSURL* disUrl = [[NSBundle mainBundle]URLForResource:@"dis" withExtension:@"wav"];
        NSURL *guUrl = [[NSBundle mainBundle]URLForResource:@"gu" withExtension:@"mp3"];
        
//        加载音效文件
        AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(disUrl), &(dis));
        AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(guUrl), &(gu));
//        使用图片平铺作为定义连接线的颜色
        bubbleColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bubble.jpg"]];
        
    }
    return self;
}

@end
