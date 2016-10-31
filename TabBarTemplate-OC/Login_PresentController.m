//
//  Login_PresentController.m
//  TabBarTemplate-OC
//
//  Created by issuser on 2016/10/18.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import "Login_PresentController.h"
#import "UIImage+FKCategory.h"
#import "UIImageEffects.h"

@implementation Login_PresentController
{
    UIControl* dimmingView;
}

/**呈现弹出开始*/
- (void)presentationTransitionWillBegin{
    [super presentationTransitionWillBegin];
    
    //
    UIImage *clipImg = [UIImage captureView:self.presentingViewController.view];
    UIColor *tintColor = [UIColor colorWithWhite:0.10 alpha:0.3];
    UIImage *blurImg = [UIImageEffects imageByApplyingBlurToImage:clipImg withRadius:10 tintColor:tintColor saturationDeltaFactor:1.8 maskImage:nil];
    UIImageView *bgImgView = [[UIImageView alloc] initWithImage:blurImg];
    
    
    if (!dimmingView) {
        dimmingView = [[UIControl alloc] initWithFrame:self.containerView.bounds];
    }
    //    dimmingView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1.0 alpha:0.5];
    dimmingView.alpha = 0;
    [dimmingView addSubview:bgImgView];
    
    [self.containerView addSubview:dimmingView];
    
    //调整背景亮度
    [self.presentingViewController.transitionCoordinator animateAlongsideTransition:^(id anima){
        
        dimmingView.alpha = 1;
    } completion:nil];
}
/**呈现弹出结束*/
- (void)presentationTransitionDidEnd:(BOOL)completed{
    if (!completed) { // 过程失败
        [dimmingView removeFromSuperview];
    }
}
/**解除呈现开始*/
- (void)dismissalTransitionWillBegin{
    
    [self.presentingViewController.transitionCoordinator animateAlongsideTransition:^(id anima){
        dimmingView.alpha = 0;
    } completion:nil];
}
/**解除呈现结束*/
- (void)dismissalTransitionDidEnd:(BOOL)completed{
    if (completed) {
        [dimmingView removeFromSuperview];
    }
}
// 返回将要呈现的视图的最终Rect
-(CGRect)frameOfPresentedViewInContainerView{
    
    if (self.frameDelegate && [self.frameDelegate respondsToSelector:@selector(frameOfPresentedViewForPresentationController:)]) {
        
        return [self.frameDelegate frameOfPresentedViewForPresentationController:self];
    }
    CGRect finalRect = CGRectInset(self.containerView.frame, 50, 50);
    return finalRect;
}

-(void)dealloc{
    
    dimmingView = nil;
}
@end
