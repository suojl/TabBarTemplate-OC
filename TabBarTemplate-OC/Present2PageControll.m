//
//  Present2PageControll.m
//  TabBarTemplate-OC
//
//  Created by issuser on 16/7/18.
//
//

#import "Present2PageControll.h"

@implementation Present2PageControll
{
    UIControl* dimmingView;
}

/**呈现弹出开始*/
- (void)presentationTransitionWillBegin{
    [super presentationTransitionWillBegin];
    
    dimmingView = [[UIControl alloc] initWithFrame:self.containerView.bounds];
    dimmingView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1.0 alpha:0.5];
    dimmingView.alpha = 0;
    [self.containerView addSubview:dimmingView];
    [dimmingView addTarget:self action:@selector(closePressingVC) forControlEvents:UIControlEventTouchDown];
    
    //调整背景亮度
    [self.presentingViewController.transitionCoordinator animateAlongsideTransition:^(id anima){
        
        dimmingView.alpha = 1;
    } completion:nil];
}
/**呈现弹出结束*/
- (void)presentationTransitionDidEnd:(BOOL)completed{
    if (!completed) {
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

-(CGRect)frameOfPresentedViewInContainerView{
    
    return CGRectInset(self.containerView.frame, 50, 50);
}

-(void)closePressingVC{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];;
}
@end
