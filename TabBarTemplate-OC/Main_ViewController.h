//
//  Main_ViewController.h
//  TabBarTemplate-OC
//
//  Created by issuser on 16/6/2.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+SDAutoLayout.h"

@interface Main_ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIView* view0;
@property (nonatomic, strong) IBOutlet UIView* view1;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint* withContraint;

@end
