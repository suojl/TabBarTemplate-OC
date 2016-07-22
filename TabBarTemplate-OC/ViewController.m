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

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
    AFNetworkReachabilityManager *ada = [AFNetworkReachabilityManager sharedManager];
    if ([ada isReachableViaWiFi]) {
        DLog(@"当前处于WiFi环境下!!!");
    }
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
    
    
    // loadImage 使用SDWebImage下载图片
    NSString* imageURLPath = @"http://www.pptbz.com/pptpic/UploadFiles_6909/201110/20111014111307895.jpg";
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    // 下载指定URL的图片资源，图片储存在Caches目录下
    [manager downloadImageWithURL:[NSURL URLWithString:imageURLPath]
                          options:0
                         progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                             // progression tracking code
                             DLog(@"%ld",receivedSize/expectedSize);
                         }
                        completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                            if (image) {
                                // do something with image
                                DLog(@"%@",[imageURL absoluteString]);
                                DLog(@"%@",[AuxFileManage getCachesPath]);
                                SDImageCache *imageCache = [SDImageCache sharedImageCache];
                                [imageCache queryDiskCacheForKey:imageURLPath done:^(UIImage *image2,SDImageCacheType cacheType) {
                                    self.sdImageView.image = image2;
                                }];
                            }
                        }];
    
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
