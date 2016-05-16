//
//  BaseTabBarController.m
//  TabBarTemplate-OC
//
//  Created by issuser on 16/5/11.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import "BaseTabBarController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.tabBar.hidden = YES;
//    UIView* viewsa = [[UIView alloc] initWithFrame:self.tabBar.frame];
//    viewsa.backgroundColor = [UIColor redColor];
//    [self.view addSubview:viewsa];
    
    NSMutableArray *vcs=[NSMutableArray arrayWithCapacity:3];//创建一个数组来保存controller对象
    
    UIStoryboard *main=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIStoryboard *main1=[UIStoryboard storyboardWithName:@"Storyboard2" bundle:[NSBundle mainBundle]];
    UIStoryboard *main2=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    
    UIViewController *vc1=[main instantiateViewControllerWithIdentifier:@"main"];//根据storyboard和controller的storyId找到控制器
    vc1.tabBarItem.title = @"111";
    UIViewController *vc2=[main1 instantiateViewControllerWithIdentifier:@"main2"];
    vc2.tabBarItem.title = @"222";
    UIViewController *vc3=[main2 instantiateViewControllerWithIdentifier:@"main"];
    vc3.tabBarItem.title = @"333";
    
    [vcs addObject:vc1];
    [vcs addObject:vc2];
    [vcs addObject:vc3];
    
    [self setViewControllers:vcs animated:NO];//用当前的viewController数组替换原本的tabbarControlle的 viewControllers数组
    self.selectedIndex = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
