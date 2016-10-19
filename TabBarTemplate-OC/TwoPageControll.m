//
//  TwoPageControll.m
//  TabBarTemplate-OC
//
//  Created by issuser on 16/7/18.
//
//

#import "TwoPageControll.h"
#import "UIImage+FKCategory.h"

@implementation TwoPageControll

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC fromView:(UIView *)fromView toView:(UIView *)toView{
    // 展现动画的容器视图
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    if (!self.reverse) {
        // 转场动画背景图片
        UIView* bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        bgView.backgroundColor = [UIColor clearColor];
        [containerView insertSubview:bgView atIndex:0];
        /* snapshotViewAfterScreenUpdates 在IOS 10中失效 */
//        UIView* fromView = [fromVC.view snapshotViewAfterScreenUpdates:NO];
        
        // 使用fromVC.view 作为动画
        UIImage *fromViewSnapshot = [UIImage captureView:fromVC.view];
        UIImageView* fromView = [[UIImageView alloc] initWithImage:fromViewSnapshot];
        fromView.frame = fromVC.view.bounds;
        
        [containerView addSubview:fromView];
        
//        CGRect finalFrame = toVC.view.frame;
        CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];// 获取最终视图frame
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
                             
                             fromView.transform = CGAffineTransformMakeScale(0.9, 0.9);
                             
                         } completion:^(BOOL finished) {
                             // 5. Tell context that we completed.
                             [transitionContext completeTransition:YES];
                         }];
    }else{
        // 转场动画背景图片
//        UIView* bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        containerView.backgroundColor = [UIColor clearColor];
//        [containerView addSubview:bgView];
        /* snapshotViewAfterScreenUpdates 在IOS 10中失效 */
//        UIView* toView = [toVC.view snapshotViewAfterScreenUpdates:NO];
        UIImage *toViewSnapshot = [UIImage captureView:toVC.view];
        
        UIImageView* toView1 = [[UIImageView alloc] initWithImage:toViewSnapshot];
        toView1.frame = toVC.view.bounds;
        
        toView1.transform = CGAffineTransformIdentity;
        toView1.transform = CGAffineTransformMakeScale(0.9, 0.9);
        [containerView addSubview:toView1];
        
//        CGRect initFrame= fromVC.view.frame;
        CGRect initFrame = [transitionContext initialFrameForViewController:fromVC];
        CGRect finalFrame = CGRectOffset(initFrame, 0, ScreenHeight);
        
        [containerView addSubview:fromVC.view];
        
        [UIView animateWithDuration:duration animations:^{
            fromVC.view.frame = finalFrame;
            toView1.transform = CGAffineTransformMakeScale(1.0, 1.0);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
        
    }
    
}
@end
