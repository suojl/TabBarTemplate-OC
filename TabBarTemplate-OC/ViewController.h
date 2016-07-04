//
//  ViewController.h
//  TabBarTemplate-OC
//
//  Created by issuser on 16/5/11.
//  Copyright © 2016年 isoftston. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate>

@property (nonatomic, strong) IBOutlet UITextField* userNameTF;
@property (nonatomic, strong) IBOutlet UITextField* passwordTF;
@property (nonatomic, strong) IBOutlet UIView* topView;
@property (nonatomic, strong) IBOutlet UIView* centerView;
@property (nonatomic, strong) IBOutlet UIView* aboveBannerView;

-(IBAction)alertTest:(id)sender;
@end

