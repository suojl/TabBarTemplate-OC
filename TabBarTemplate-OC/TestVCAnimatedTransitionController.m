//
//  TestVCAnimatedTransitionController.m
//  TabBarTemplate-OC
//
//  Created by issuser on 16/7/20.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import "TestVCAnimatedTransitionController.h"
#import "TestViewController.h"
#import "UIImage+FKCategory.h"

@implementation TestVCAnimatedTransitionController


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC fromView:(UIView *)fromView toView:(UIView *)toView{
//    TestViewController* toViewController = (TestViewController *)toVC;
    // 展现动画的容器视图
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    if (!self.reverse) {
        [toVC updateViewConstraints];
        
        CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
        toView.frame = finalFrame;  // 必须的
        toView.alpha = 0;
        toView.hidden = YES;
        DLog(@"----------- : %ld",toView.subviews.count);
        [containerView addSubview:toView];
        
        /*** 使用snapshotViewAfterScreenUpdates屏幕会闪 ***/
//        [toView snapshotViewAfterScreenUpdates:YES];
//        UIImage *toViewSnapshot = [UIImage captureView:toView];
//        UIImageView* toView2 = [[UIImageView alloc] initWithImage:toViewSnapshot];
//        toView2.frame = toView.bounds;
//        [containerView addSubview:toView2];
//        
//        // 添加TopView到容器视图
//        UIView* topView = toViewController.topView;
//        [topView layoutSubviews];
//        
////        UIView* topViewSnapshot = [topView snapshotViewAfterScreenUpdates:NO];
//        UIImageView* topViewSnapshot = [[UIImageView alloc] initWithImage:[UIImage captureView:topView]];
//        topViewSnapshot.frame = CGRectOffset(topView.frame, 0, -topView.frame.size.height);
//        [containerView addSubview:topViewSnapshot];
////        topView.hidden = YES;
        
        // 添加bottomView到容器视图
//        UIView* bottomView = toView.subviews[0];//toViewController.bottomView;
////        UIView* bottomViewSnapshot = [bottomView snapshotViewAfterScreenUpdates:NO];
//        UIImageView* bottomViewSnapshot = [[UIImageView alloc] initWithImage:[UIImage captureView:bottomView]];
//        bottomViewSnapshot.frame = CGRectOffset(bottomView.frame,0,bottomView.frame.size.height);
//        [containerView addSubview:bottomViewSnapshot];
//        bottomView.hidden = YES;
        /*** 使用snapshotViewAfterScreenUpdates屏幕会闪 ***/
        
        [UIView animateWithDuration:0.1f
                         animations:^{

                         } completion:^(BOOL finished) {
                             
                             /***===========此时 toVC 已经完成了布局 ======***/
                             
                             // 头部视图动画
                             UIView* topView = [toView viewWithTag:2];//toView.subviews[0];
                             
                             //        UIView* topViewSnapshot = [topView snapshotViewAfterScreenUpdates:NO];
                             UIImageView* topViewSnapshot = [[UIImageView alloc] initWithImage:[UIImage captureView:topView]];
                             topViewSnapshot.frame = CGRectOffset(topView.frame, 0, -topView.frame.size.height);
                             [containerView addSubview:topViewSnapshot];
                            
                             // 底部视图动画
                             UIView* bottomView = toView.subviews[1];//toViewController.bottomView;
                             //        UIView* bottomViewSnapshot = [bottomView snapshotViewAfterScreenUpdates:NO];
                             UIImageView* bottomViewSnapshot = [[UIImageView alloc] initWithImage:[UIImage captureView:bottomView]];
                             bottomViewSnapshot.frame = CGRectOffset(bottomView.frame,0,bottomView.frame.size.height);
                             [containerView addSubview:bottomViewSnapshot];
                             
                             [topView setHidden:YES];
                             [bottomView setHidden:YES];
                             // 动画2
                             [UIView animateWithDuration:duration animations:^{
                                 
                                 bottomViewSnapshot.frame = bottomView.frame;
                                 topViewSnapshot.frame = topView.frame;
                                 
                                 toView.alpha = 1;
                                 toView.hidden = NO;
                             } completion:^(BOOL finished){
                                 
                                 [topView setHidden:NO];
                                 [bottomView setHidden:NO];
                                 [topViewSnapshot removeFromSuperview];
                                 [bottomViewSnapshot removeFromSuperview];
                                 
                                 
                                 [transitionContext completeTransition:YES];
                             }];
                             /***===========================***/
                         }];
    }else{
        
        CGRect initFrame = [transitionContext initialFrameForViewController:fromVC];
        CGRect finalFrame = CGRectOffset(initFrame, 0, ScreenHeight);
        
        [containerView addSubview:fromVC.view];
        
        [UIView animateWithDuration:duration animations:^{
            fromVC.view.frame = finalFrame;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
        
    }
    
}
@end
