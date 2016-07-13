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

@interface ViewController ()<UIAlertViewDelegate>

@end

@implementation ViewController
{
//    IQKeyboardReturnKeyHandler * returnKeyHandler;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userNameTF.shouldHideTitle = YES;
    // Do any additional setup after loading the view, typically from a nib.
    /**
//    设置状态栏样式
//    self.navigationController.navigationBarHidden = YES;
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
     */
//    
//    returnKeyHandler = [[IQKeyboardReturnKeyHandler alloc] initWithViewController:self];
//    [returnKeyHandler setLastTextFieldReturnKeyType:UIReturnKeyDone];
}

-(IBAction)gotonext:(id)sender{
    [[IQKeyboardManager sharedManager] goNext];
}
-(IBAction)alertTest:(id)sender{
//    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"登录" message:@"请输入用户名和密码" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//    alertView.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
//    [alertView show];
    
//    [AFMInfoBanner showAndHideWithText:@"hello" style:AFMInfoBannerStyleInfo];
    /* --------------AFMInfoBanner---警告提示----------------*/
    AFMInfoBanner* afmtest = [[AFMInfoBanner alloc] initWithTargetView:self.centerView viewAboveBanner:nil additionalTopSpacing:0];
    
    afmtest.style = AFMInfoBannerStyleInfo;
    afmtest.text = @"hello test";
    
    [afmtest showAndHideAfter:2.0 animated:YES];
    /* --------------AFMInfoBanner-------------------*/
    
    
}

- (IBAction)unwindSegue:(UIStoryboardSegue *)sender{
    NSLog(@"unwindSegue %@", sender);
    DLog(@"------打印内容!!!-------");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 设置状态栏样式
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"--%s--%ld",__FUNCTION__,buttonIndex);
    if (buttonIndex == 1) {
        self.userNameTF.text = [alertView textFieldAtIndex:0].text;
        self.passwordTF.text = [alertView textFieldAtIndex:1].text;
    }
}
@end
