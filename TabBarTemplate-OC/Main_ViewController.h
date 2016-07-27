//
//  Main_ViewController.h
//  TabBarTemplate-OC
//
//  Created by issuser on 16/6/2.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+SDAutoLayout.h"
#import "CustomTableViewController.h"

@interface Main_ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITableView* tableView;

@property (nonatomic, strong) CustomTableViewController* tableViewVC;

@end
