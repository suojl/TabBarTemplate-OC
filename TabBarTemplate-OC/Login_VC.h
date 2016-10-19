//
//  Login_VC.h
//  TabBarTemplate-OC
//
//  Created by issuser on 2016/10/17.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DismissViewControllerProtocol.h"

@interface Login_VC : UIViewController

@property (nonatomic, strong) IBOutlet UITextField* accountView;
@property (nonatomic, strong) IBOutlet UITextField* passwordView;
@property (nonatomic, strong) IBOutlet UITextField* verificView;

@property (nonatomic, weak) id<DismissViewControllerProtocol> delegate;

@property (nonatomic, strong) UIButton* loginBtn;
-(IBAction)loginAction:(id)sender;

@end
