//
//  DismissViewControllerProtocol.h
//  TabBarTemplate-OC
//
//  Created by issuser on 16/7/20.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DismissViewControllerProtocol <NSObject>

@required

@optional

/**
 * @param 关闭弹出控制器
 */
-(void) presentingViewControllerDidClickedDismissButton:(UIViewController *)viewController;

@end
