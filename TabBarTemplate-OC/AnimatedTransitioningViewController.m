//
//  AnimatedTransitioningViewController.m
//  TabBarTemplate-OC
//
//  Created by issuser on 2016/11/1.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import "AnimatedTransitioningViewController.h"

#import "Login_AnimatedTransitioningControll.h"

@interface AnimatedTransitioningViewController ()

@end

@implementation AnimatedTransitioningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIViewControllerTransitioningDelegate    自定义转场动画代理实现
// 返回 转场动画控制器() ①
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source NS_AVAILABLE_IOS(8_0){
    //        弱引用类型变量不能直接使用新建对象指针
    //        _presentController = [[Login_PresentController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    if(!_presentController){
        BasePresentationController *presentControl = [[BasePresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
        presentControl.popPresentDelegate = self;
        presentControl.blur_Flag = self.blurBackground;
        _presentController = presentControl;
        return _presentController;
    }
    
    return _presentController;
}
// 呈现新视图控制器时使用的转场动画 ②
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    return [self transitionAnimate:@"1"];
}
// 返回父视图控制器时使用的转场动画 ③
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    return [self transitionAnimate:@"0"];
}

// 返回父视图控制器时使用的手势交互控制器 ④
//- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator{
//    return nil;
//}

-(id<UIViewControllerAnimatedTransitioning>)transitionAnimate:(NSString *)toNew{
    
    Class clazz = NSClassFromString(@"Login_AnimatedTransitioningControll");
    id animate = [[clazz alloc] init];
    [animate setValue:toNew forKey:@"reverse"];
    return animate;
}

@end
