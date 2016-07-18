//
//  TwoPageControll.m
//  TabBarTemplate-OC
//
//  Created by issuser on 16/7/18.
//
//

#import "TwoPageControll.h"

@implementation TwoPageControll

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC{
    // 展现动画的容器视图
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    if (!self.reverse) {
        // 转场动画背景图片
        UIView* bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        bgView.backgroundColor = [UIColor grayColor];
        [containerView addSubview:bgView];
        UIView* fromView = [fromVC.view snapshotViewAfterScreenUpdates:NO];
        [containerView addSubview:fromView];
        
        CGRect finalFrame = toVC.view.frame;
        CGRect initFrame = CGRectOffset(finalFrame, 0, ScreenHeight);
        toVC.view.frame = initFrame;
        
        [containerView addSubview:toVC.view];
        [UIView animateWithDuration:duration
                              delay:0.0
             usingSpringWithDamping:1.0
              initialSpringVelocity:0.0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             toVC.view.frame = finalFrame;
                             
                             fromView.transform = CGAffineTransformMakeScale(0.8, 0.8);
                             
                         } completion:^(BOOL finished) {
                             // 5. Tell context that we completed.
                             [transitionContext completeTransition:YES];
                         }];
    }else{
        // 转场动画背景图片
        UIView* bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        bgView.backgroundColor = [UIColor grayColor];
        [containerView addSubview:bgView];
        UIView* toView = [toVC.view snapshotViewAfterScreenUpdates:NO];
        toView.transform = CGAffineTransformIdentity;
        toView.transform = CGAffineTransformMakeScale(0.85, 0.85);
        [containerView addSubview:toView];
        
        CGRect initFrame= fromVC.view.frame;
        CGRect finalFrame = CGRectOffset(initFrame, 0, ScreenHeight);
        
        [containerView addSubview:fromVC.view];
        
        [UIView animateWithDuration:duration
                              delay:0.0
             usingSpringWithDamping:1.0
              initialSpringVelocity:0.0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             fromVC.view.frame = finalFrame;
                             toView.transform = CGAffineTransformMakeScale(1.0, 1.0);
                         } completion:^(BOOL finished) {
                             // 5. Tell context that we completed.
                             [transitionContext completeTransition:YES];
                         }];
    }
    
}
@end
