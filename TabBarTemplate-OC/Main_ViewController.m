//
//  Main_ViewController.m
//  TabBarTemplate-OC
//
//  Created by issuser on 16/6/2.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import "Main_ViewController.h"

@interface Main_ViewController ()
{
    UIView* _view1;
}
@end

@implementation Main_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view removeConstraint:self.withContraint];
    self.withContraint.constant = 40;
//    view1.backgroundColor = [UIColor redColor];
    
    UIView* view2 = [UIView new];
    [view2 setBackgroundColor:[UIColor redColor]];
    // 先将子视图添加到父视图中再进行布局
    [self.view1 addSubview:view2];
    view2.sd_layout
    .leftSpaceToView(self.view1, 10)
    .topSpaceToView(self.view1, 10)
    .heightIs(100)
    .widthRatioToView(self.view1, 0.8);
    
    UIView* view3 = [UIView new];
    [view3 setBackgroundColor:[UIColor grayColor]];
    // 先将子视图添加到父视图中再进行布局
    [self.view1 addSubview:view3];
    view3.sd_layout
    .leftSpaceToView(view2,0)
    .topEqualToView(view2)
    .bottomEqualToView(view2)
    .widthRatioToView(self.view1, 0.2);
    
    NSLog(@"x::: %ld",[self.view constraints].count);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
    [self.view0 addSubview:self.view1];
    
    self.view1.sd_layout
    .leftSpaceToView(self.view0, 0)
    .topEqualToView(self.view0)
    .heightRatioToView(self.view0,0.9)
    .widthRatioToView(self.view0, 0.9);
    
//    [self.view1 updateLayout];  // 设置完视图布局后刷新布局
    
    NSLog(@"x::: %ld",[self.view constraints].count);
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
