//
//  TestViewController.m
//  TabBarTemplate-OC
//
//  Created by issuser on 16/7/20.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)goBackAction:(id)sender{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(presentingViewControllerDidClickedDismissButton:)]) {
        [self.delegate presentingViewControllerDidClickedDismissButton:self];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
