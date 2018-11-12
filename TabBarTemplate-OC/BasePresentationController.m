//
//  BasePresentationController.m
//  TabBarTemplate-OC
//
//  Created by issuser on 2016/11/1.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import "BasePresentationController.h"
#import "UIImage+FKCategory.h"
#import "UIImageEffects.h"

@interface BasePresentationController()
{
    UIControl* _dimmingView;
}
@end

@implementation BasePresentationController

/**呈现弹出开始*/
- (void)presentationTransitionWillBegin{
    [super presentationTransitionWillBegin];
    
    if (!_dimmingView) {
        _dimmingView = [[UIControl alloc] initWithFrame:self.containerView.bounds];
    }
    //
    UIImage *clipImg = [UIImage captureView:self.presentingViewController.view];
    if (_blur_Flag) {   //是否设置模糊背景效果
        UIColor *tintColor = [UIColor colorWithWhite:0.10 alpha:0.3];
        clipImg = [UIImageEffects imageByApplyingBlurToImage:clipImg withRadius:10 tintColor:tintColor saturationDeltaFactor:1.8 maskImage:nil];
    }
    UIImageView *bgImgView = [[UIImageView alloc] initWithImage:clipImg];
//    dimmingView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1.0 alpha:0.5];
    _dimmingView.alpha = 0;
    [_dimmingView addSubview:bgImgView];
    
    [self.containerView addSubview:_dimmingView];//设置转场动画的背景
    if (_shouldDismissWhenTap) {//点击背景是否关闭
        [_dimmingView addTarget:self action:@selector(closePresentedVC) forControlEvents:UIControlEventTouchUpInside];
    }
    //调整背景透明度
    [self.presentingViewController.transitionCoordinator animateAlongsideTransition:^(id anima){
        
        self->       _dimmingView.alpha = 1;
    } completion:nil];
}
/**呈现弹出结束*/
- (void)presentationTransitionDidEnd:(BOOL)completed{
    if (!completed) { // 过程失败
        [_dimmingView removeFromSuperview];
    }
}
/**解除呈现开始*/
- (void)dismissalTransitionWillBegin{
    
    [self.presentingViewController.transitionCoordinator animateAlongsideTransition:^(id anima){
        self->_dimmingView.alpha = 0;
    } completion:nil];
}
/**解除呈现结束*/
- (void)dismissalTransitionDidEnd:(BOOL)completed{
    if (completed) {
        [_dimmingView removeFromSuperview];
    }
}
// 返回将要呈现的视图的最终Rect
-(CGRect)frameOfPresentedViewInContainerView{
    
    if (self.popPresentDelegate && [self.popPresentDelegate respondsToSelector:@selector(frameOfPresentedViewForPresentationController:)]) {
        
        return [self.popPresentDelegate frameOfPresentedViewForPresentationController:self];
    }
    CGRect finalRect = CGRectInset(self.containerView.frame, 50, 50);
    return finalRect;
}

-(void)closePresentedVC{
    DLog(@"---%@",[self.presentingViewController class]);
    DLog(@"---%@",[self.presentedViewController class]);
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];;
}
-(void)dealloc{
    
    _dimmingView = nil;
}
@end
