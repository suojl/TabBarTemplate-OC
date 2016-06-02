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

@interface AppDelegate (){
    DGAaimaView *animaView;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [[BaseTabBarController alloc] init];
    
    [self.window makeKeyAndVisible];
    
    //-----------------------------------------------------
    
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
        launchView.backgroundColor = [UIColor redColor];
        labCopy.frame = mainRect;
    } completion:^(BOOL finished){
        if ([self respondsToSelector:@selector(removeView:)]) {
            [self performSelector:@selector(removeView:) withObject:launchView afterDelay:.5f];
        }
    }];
    
//    [UIView animateWithDuration:3.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        launchView.backgroundColor = [UIColor redColor];
//        labCopy.frame = mainRect;
//    } completion:^(BOOL finished){
//        [launchView removeFromSuperview];
//    }];
    
    return YES;
}

-(void)removeView:(UIView*)subView{
    [subView removeFromSuperview];
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

@end
