//
//  ViewController.m
//  TabBarTemplate-OC
//
//  Created by issuser on 16/5/11.
//  Copyright © 2016年 isoftston. All rights reserved.
//

#import "ViewController.h"
#import "IQKeyboardManager.h"
//#import "IQKeyboardReturnKeyHandler.h"
#import "IQUIView+IQKeyboardToolbar.h"
#import "AFMInfoBanner.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "AuxFileManage.h"
#import "Masonry.h"

#import "Login_VC.h"
@interface ViewController ()<UIAlertViewDelegate,DismissViewControllerProtocol>

@end

@implementation ViewController
{
//    IQKeyboardReturnKeyHandler * returnKeyHandler;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.userNameTF.shouldHideTitle = YES;
    // Do any additional setup after loading the view, typically from a nib.
    /**
//    设置状态栏样式
    self.navigationController.navigationBarHidden = YES;
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlack; // 导航栏为黑色，状态栏字体为白色
     */
//    
//    returnKeyHandler = [[IQKeyboardReturnKeyHandler alloc] initWithViewController:self];
//    [returnKeyHandler setLastTextFieldReturnKeyType:UIReturnKeyDone];
//    [SJLSignalHandler RegisterSignalHandler];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
}
-(IBAction)gotonext:(id)sender{
    [[IQKeyboardManager sharedManager] goNext];
}
-(IBAction)alertTest:(id)sender{
//    abort();
//    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"登录" message:@"请输入用户名和密码" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//    alertView.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
//    [alertView show];
    
//    [AFMInfoBanner showAndHideWithText:@"hello" style:AFMInfoBannerStyleInfo];
    /* --------------AFMInfoBanner---警告提示----------------*/
    AFMInfoBanner* afmtest = [[AFMInfoBanner alloc] initWithTargetView:self.centerView viewAboveBanner:nil additionalTopSpacing:0];
//    NSArray *list = @[@0,@1];
//    DLog(@"-----list%@",list[12]);
//    [self performSelector:@selector(aaaaaa:)];
//
    afmtest.style = AFMInfoBannerStyleInfo;
    afmtest.text = @"hello test";

    [afmtest showAndHideAfter:2.0 animated:YES];
    /* --------------AFMInfoBanner-------------------*/
    
    Login_VC *loginVC = [[Login_VC alloc] initWithNibName:@"Login_VC" bundle:nil];
    loginVC.delegate = self;
    loginVC.blurBackground = YES;
//    loginVC.animateControllerClass = @"Login_PresentController";
    [self presentViewController:loginVC animated:YES completion:nil];
}


-(void)presentingViewControllerDidClickedDismissButton:(UIViewController *)viewController{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)unwindSegueToStoryboard1_navMain:(UIStoryboardSegue *)sender{
    DLog(@"------打印内容!!!-------");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 设置状态栏样式
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"--%s--%ld",__FUNCTION__,(long)buttonIndex);
    if (buttonIndex == 1) {
        self.userNameTF.text = [alertView textFieldAtIndex:0].text;
        self.passwordTF.text = [alertView textFieldAtIndex:1].text;
    }
}
@end
