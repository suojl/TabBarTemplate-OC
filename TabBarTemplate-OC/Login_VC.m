//
//  Login_VC.m
//  TabBarTemplate-OC
//
//  Created by issuser on 2016/10/17.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import "Login_VC.h"
#import "PanGestureInteractiveTransition.h"
#import "Login_PresentController.h"
#import "Login_AnimatedTransitioningControll.h"

@interface Login_VC () <UIViewControllerTransitioningDelegate,FrameOfViewControllerPresentedProtocol>
{
    Login_PresentController* _presentController;
}

@property (nonatomic, strong) BaseAnimatedTransitioningControll * animatedControll;
@end

@implementation Login_VC

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        // 转场动画代理
        self.transitioningDelegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.animatedControll = [[Login_AnimatedTransitioningControll alloc] init];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    DLog(@"viewDidLayoutSubviews");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)loginAction:(id)sender{
    [[NSUserDefaults standardUserDefaults] setObject:@1 forKey:USER_LOGINED];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(presentingViewControllerDidClickedDismissButton:)]) {
        [self.delegate presentingViewControllerDidClickedDismissButton:self];
    }
}

#pragma mark - UIViewControllerTransitioningDelegate    自定义转场动画代理实现
// 返回 转场动画控制器 ①
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source NS_AVAILABLE_IOS(8_0){
    
    if(!_presentController){
        _presentController = [[Login_PresentController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
        _presentController.frameDelegate = self;
    }
    return _presentController;
}
// 返回呈现新视图控制器时使用的转场动画 ②
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    if (!self.animatedControll) {
        self.animatedControll = [[Login_AnimatedTransitioningControll alloc] init];
    }
    self.animatedControll.reverse = NO;
    return self.animatedControll;
}
// 返回父视图控制器时使用的转场动画 ③
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    self.animatedControll.reverse = YES;
    return self.animatedControll;
}

// 返回父视图控制器时使用的手势交互控制器 ④
//- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator{
//    return nil;
//}
#pragma mark - FrameOfViewControllerPresentedProtocol
-(CGRect)frameOfPresentedViewForPresentationController:(UIPresentationController *)presentationController{
    
    return CGRectInset(presentationController.containerView.frame, 50, 100);
}
@end
