//
//  YPInteractiveTransition.h
//  自定义转场动画
//
//  Created by navchina on 2017/9/6.
//  Copyright © 2017年 laiyongpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

//定义手势方向
typedef NS_ENUM(NSUInteger, YPPercentInteractiveTransitionDirection){

    YPPercentInteractiveTransitionDirectionLeft,
    YPPercentInteractiveTransitionDirectionRight,
    YPPercentInteractiveTransitionDirectionDown,
    YPPercentInteractiveTransitionDirectionUp
    
};

@interface YPInteractiveTransition : UIPercentDrivenInteractiveTransition



@end
