//
//  CustomPresentAnimationVC.m
//  自定义转场动画
//
//  Created by navchina on 2017/9/5.
//  Copyright © 2017年 laiyongpeng. All rights reserved.
//

#import "CustomPresentAnimationVC.h"

@implementation CustomPresentAnimationVC

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{

    return 1.0f;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{

//    fromVC
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromV = fromVc.view;
    UIView *toV = toVC.view;
    
    //toVC 调用viewWillAppear
    [toVC beginAppearanceTransition:YES animated:YES];
    
    if (self.isDismiss) {
        
        [self dismissTransition:transitionContext fromVC:fromVc fromV:fromV toVC:toVC toV:toV];
        
    }else{
    
        [self presentTransition:transitionContext fromVC:fromVc fromV:fromV toVC:toVC toV:toV];
    }
    //    fromVC 调用viewDidDisappear
    [fromVc beginAppearanceTransition:NO animated:YES];
}

-(void)presentTransition:(id <UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController*)fromVC fromV:(UIView *)fromV toVC:(UIViewController *)toVC toV:(UIView *)toV{
    
//fromVC ViewController   toVC secondVC
    UIView *containerView = [transitionContext containerView];
    //获取fromVC的frame
    CGRect frame = [transitionContext initialFrameForViewController:fromVC];
    //底部滑进，离屏滑出，即y坐标为从height --->0
    CGRect offScreenFrame = frame;
    offScreenFrame.origin.y = offScreenFrame.size.height;
    toV.frame = offScreenFrame;
    
    [containerView insertSubview:toV aboveSubview:fromV];
    
//    三维变化
    CATransform3D t1 = CATransform3DIdentity;
    t1.m34 = 1.0/-1000;
//    x和y轴缩放，然后选择一点
    t1 = CATransform3DScale(t1, 0.95, 0.95, 1);
    t1 = CATransform3DRotate(t1, 15.0f * M_PI/180.0f, 1, 0, 0);
    
    CATransform3D t2 = CATransform3DIdentity;
    t2.m34 = 1.0/-1000;
    //y轴向上平移一段距离
    t2 = CATransform3DTranslate(t2, 0, -fromV.frame.size.height *0.08, 0);
//    缩小
    t2 = CATransform3DScale(t2, 0.8, 0.8, 1);
    
    //执行动画
    [UIView animateKeyframesWithDuration:1.0f delay:0.0f options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        //开始时间，持续时间
        [UIView addKeyframeWithRelativeStartTime:0.0f relativeDuration:0.4f animations:^{
            fromV.layer.transform = t1;
            fromV.alpha = 0.6;
        }];
        [UIView addKeyframeWithRelativeStartTime:0.1f relativeDuration:0.5f animations:^{
            fromV.layer.transform = t2;
        }];
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:1.0f animations:^{
            toV.frame = frame;
        }];
        
    } completion:^(BOOL finished) {
        //过渡动画结束
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
}

-(void)dismissTransition:(id <UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController*)fromVC fromV:(UIView *)fromV toVC:(UIViewController *)toVC toV:(UIView *)toV{

    CGRect frame = [transitionContext initialFrameForViewController:fromVC];
    toV.frame = frame;
    
    CGRect offScreenFrame = frame;
    offScreenFrame.origin.y = offScreenFrame.size.height;
    
    CATransform3D t1 = CATransform3DIdentity;
    t1.m34 = 1.0/-1000;
    t1 = CATransform3DScale(t1, 0.95, 0.95, 1);
    t1 = CATransform3DRotate(t1, 15.0f * M_PI/180.0f, 1, 0, 0);
    
    //关键帧过渡动画
    [UIView animateKeyframesWithDuration:1.0f delay:0.0f options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.0f relativeDuration:0.4f animations:^{
            fromV.frame = offScreenFrame;
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.35f relativeDuration:0.35f animations:^{
            toV.layer.transform = t1;
            toV.alpha = 1.0;
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.75f relativeDuration:0.25f animations:^{
            //还原3D状态
            toV.layer.transform = CATransform3DIdentity;
        }];
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
}

@end
