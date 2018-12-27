//
//  AppDelegate.m
//  TabBarTemplate-OC
//
//  Created by issuser on 16/5/11.
//  Copyright © 2016年 isoftston. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarController.h"
#import "DGAaimaView.h"
#import "AFNetworking.h"
#import "IQKeyboardManager.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "DSSignalHandler.h"
#import "SJLCustomFormatterLog.h"
#import "AuxFileManage.h"

@interface AppDelegate (){
    DGAaimaView *animaView;
}

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    /*-----------------------------记录日志设置结束-------------------------------*/
    // DDTTYLogger，你的日志语句将被发送到Xcode控制台
    [DDTTYLogger sharedInstance].logFormatter = [SJLCustomFormatterLog new];
    
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    [[DDTTYLogger sharedInstance] setForegroundColor:DDMakeColor(255, 255, 255) backgroundColor:DDMakeColor(255, 0, 0) forFlag:DDLogFlagError];//错误信息为红白
    [[DDTTYLogger sharedInstance] setForegroundColor:DDMakeColor(255, 255, 0) backgroundColor:DDMakeColor(0, 0, 0) forFlag:DDLogFlagWarning];//警告为黑黄
    [[DDTTYLogger sharedInstance] setForegroundColor:DDMakeColor(255, 255, 255) backgroundColor:DDMakeColor(0, 0, 255) forFlag:DDLogFlagInfo];//信息为蓝白
    [[DDTTYLogger sharedInstance] setForegroundColor:DDMakeColor(255, 97, 0) backgroundColor:DDMakeColor(0, 0, 0) forFlag:DDLogFlagDebug];//调试为黑橙
    [[DDTTYLogger sharedInstance] setForegroundColor:DDMakeColor(0, 255, 0) backgroundColor:DDMakeColor(0, 0, 0) forFlag:DDLogFlagVerbose];//详细信息为黑绿
    
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    // DDASLLogger，你的日志语句将被发送到苹果文件系统、你的日志状态会被发送到 Console.app
    [DDASLLogger sharedInstance].logFormatter = [SJLCustomFormatterLog new];
    [DDLog addLogger:[DDASLLogger sharedInstance] withLevel:DDLogLevelWarning];
    
    // DDFileLogger，你的日志语句将写入到一个文件中，默认路径在沙盒的Library/Caches/Logs/目录下，文件名为bundleid+空格+日期.log。
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24; // 刷新频率为24小时
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7; // 保存一周的日志，即7天
    fileLogger.logFormatter = [SJLCustomFormatterLog new];
    [DDLog addLogger:fileLogger withLevel:DDLogLevelWarning];
    
    [DDLog allLoggersWithLevel];
    
    // 产生Log
    DDLogVerbose(@"Verbose");   // 详细日志
    DDLogDebug(@"Debug");       // 调试日志
    DDLogInfo(@"Info");         // 信息日志
    DDLogWarn(@"Warn");         // 警告日志
    DDLogError(@"Error");       // 错误日志
//    DDLogInfo(@"----%@",[AuxFileManage getCachesPath]);
    /*-----------------------------记录日志设置结束-------------------------------*/
    // 注册捕获异常信号
    [DSSignalHandler RegisterSignalExceptionHandler];
    /*设置键盘 IQKeyboardManager*/
    [IQKeyboardManager sharedManager].toolbarManageBehaviour = IQAutoToolbarByTag;
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:YES];//显示工具条
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;//点击空白收回键盘
//    [IQKeyboardManager sharedManager].shouldPlayInputClicks = NO;
    [IQKeyboardManager sharedManager].toolbarTintColor = [UIColor redColor];
    [IQKeyboardManager sharedManager].toolbarBarTintColor = [UIColor greenColor];
    
    self.window.rootViewController = [[BaseTabBarController alloc] init];
    
    [self.window makeKeyAndVisible];
    
    [self checkNetwork];
    //-----------------------------------------------------
//    [self showLaunchingWithAnimation];
    
    return YES;
}

-(void)removeView:(UIView*)subView {
    [UIView animateWithDuration:2 animations:^{
        subView.transform = CGAffineTransformMakeScale(1.3, 1.3);
        subView.alpha = .0f;
    } completion:^(BOOL finished) {
        [subView removeFromSuperview];
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)showLaunchingWithAnimation {
    UIStoryboard *main=[UIStoryboard storyboardWithName:@"LaunchScreen" bundle:[NSBundle mainBundle]];
    UIViewController *vc1=[main instantiateViewControllerWithIdentifier:@"launchScreen"];
    UIView* launchView = vc1.view;
    
    [self.window addSubview:launchView];
    
    [launchView layoutIfNeeded];    //刷新布局
    
    UIImageView* bgView = (UIImageView* )[launchView viewWithTag:110];
    UIImageView* labView = (UIImageView* )[launchView viewWithTag:111];
    CGRect labFrame = labView.frame;
    
    //    animaView = [[DGAaimaView alloc]initWithFrame:launchView.bounds];
    //    [bgView addSubview:animaView];
    //    [animaView DGAaimaView:animaView BigCloudSpeed:1.5 smallCloudSpeed:1 earthSepped:1.0 huojianSepped:2.0 littleSpeed:2];
    
    UIImageView* labCopy = [[UIImageView alloc] initWithFrame:labFrame];
    labCopy.image = labView.image;
    
    [bgView addSubview:labCopy];
    [bgView bringSubviewToFront:labCopy];
    
    [labView removeFromSuperview];
    
    CGRect mainRect = CGRectOffset(labFrame, 0, bgView.frame.size.height/2.0);
    [UIView animateWithDuration:1.5f animations:^{
        labCopy.frame = mainRect;
    } completion:^(BOOL finished){
        if ([self respondsToSelector:@selector(removeView:)]) {
            [self performSelector:@selector(removeView:) withObject:launchView afterDelay:.5f];
        }
    }];
}

- (void)checkNetwork{
    // 开始监听网络状态
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    // 网络状态指示器
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    // 设置网络状态改变回调函数
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status){
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"网络不通");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"通过流量上网");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"通过WiFi上网");
                break;
            default:
                break;
        }
    }];
}

@end
