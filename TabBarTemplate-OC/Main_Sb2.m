//
//  Main_Sb2.m
//  TabBarTemplate-OC
//
//  Created by issuser on 16/5/12.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import "Main_Sb2.h"
#import "ViewController2.h"
#import "BaseAnimatedTransitioningControll.h"
#import "SimpleAnimatedControll.h"
#import "TwoPageControll.h"
#import "Present2PageControll.h"
#import "PanGestureInteractiveTransition.h"
#import "SimplePresentationControll.h"

@interface Main_Sb2 () <UITextFieldDelegate, UIViewControllerTransitioningDelegate>{
    
}

@property (nonatomic, strong) NSString* segueFlag;
@property (nonatomic, strong) BaseAnimatedTransitioningControll * animatedControll;
@property (nonatomic, strong) PanGestureInteractiveTransition * interactiveTransition;

@property (nonatomic, strong) IBOutlet UIScrollView* scroView;
@end

@implementation Main_Sb2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.interactiveTransition = [[PanGestureInteractiveTransition alloc] init];
}

-(void) viewDidAppear:(BOOL)animated{
    
    [self setUpScrollView];
}

-(void)setUpScrollView{
    
    NSLog(@"--%lf,--%lf",self.scroView.frame.size.height,self.scroView.frame.size.width);
    CGFloat heightScroll = self.scroView.frame.size.height;
    self.scroView.contentSize = CGSizeMake(3 * ScreenWidth, self.scroView.frame.size.height);
    UIView* redView = [UIView new];
    [redView setFrame:CGRectMake(0, 0, ScreenWidth, heightScroll)];
    redView.backgroundColor = [UIColor redColor];
    UIView* greenView = [[UIView alloc] initWithFrame:CGRectMake(ScreenWidth, 0, ScreenWidth, heightScroll)];
    greenView.backgroundColor = [UIColor greenColor];
    UIView* blueView = [[UIView alloc] initWithFrame:CGRectMake(2 * ScreenWidth, 0, ScreenWidth, heightScroll)];
    blueView.backgroundColor = [UIColor blueColor];
    [self.scroView addSubview:redView];
    [self.scroView addSubview:greenView];
    [self.scroView addSubview:blueView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)abcd:(id)sender{
    DLog(@"111111");
}
-(IBAction)abcde:(id)sender{
    DLog(@"222222");
}


- (IBAction)unwindToMain_SB2:(UIStoryboardSegue *)sender{

    DLog(@"------打印内容!!!-------");
}
-(void)dealloc{
    DLog(@"------释放资源!!!-------");
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"VC1ToVC2_Segue"]){
        self.segueFlag = @"VC1ToVC2_Segue";
        
        ViewController2* vc2 = [segue destinationViewController];
        vc2.modalPresentationStyle = UIModalPresentationCustom;
        vc2.transitioningDelegate = self;
        
        [self.interactiveTransition writeToViewController:vc2];
        self.animatedControll = [[SimpleAnimatedControll alloc] init];
    }
    if ([segue.identifier isEqualToString:@"VC1ToVC2_Segue2"]){
        self.segueFlag = @"VC1ToVC2_Segue2";
        
        ViewController2* vc2 = [segue destinationViewController];
        vc2.modalPresentationStyle = UIModalPresentationCustom;
        vc2.transitioningDelegate = self;
        
        [self.interactiveTransition writeToViewController:vc2];
        self.animatedControll = [[TwoPageControll alloc] init];
    }
    
}

#pragma mark - TransitioningDelegate    自定义转场动画代理实现

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    self.animatedControll.duration = 2.0f;
    self.animatedControll.reverse = NO;
    return self.animatedControll;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    self.animatedControll.duration = 2.0f;
    self.animatedControll.reverse = YES;
    return self.animatedControll;
}


- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator{
    return self.interactiveTransition.interacting ? self.interactiveTransition : nil;
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source NS_AVAILABLE_IOS(8_0){
    
    DLog(@"---%@",[presenting class]);
    DLog(@"---%@",[presented class]);
    
    if ([self.segueFlag isEqualToString:@"VC1ToVC2_Segue"]){
        
        return [[SimplePresentationControll alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    }
    if ([self.segueFlag isEqualToString:@"VC1ToVC2_Segue2"]){
        
        return [[Present2PageControll alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    }
    return nil;
}
@end
