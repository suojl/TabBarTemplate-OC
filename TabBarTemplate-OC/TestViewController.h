//
//  TestViewController.h
//  TabBarTemplate-OC
//
//  Created by issuser on 16/7/20.
//  Copyright © 2016年 suojl. All rights reserved.
//
#import "DismissViewControllerProtocol.h"

#import <UIKit/UIKit.h>

@interface TestViewController : UIViewController

@property (nonatomic, strong) id<DismissViewControllerProtocol> delegate;

@property (nonatomic, strong) IBOutlet UIView* topView;
@property (nonatomic, strong) IBOutlet UIView* bottomView;
@end
