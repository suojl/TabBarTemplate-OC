//
//  BaseTabBarController.m
//  TabBarTemplate-OC
//
//  Created by issuser on 16/5/11.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import "BaseTabBarController.h"
#import "Login_VC.h"
#import "DismissViewControllerProtocol.h"

@interface BaseTabBarController () <UITabBarControllerDelegate,DismissViewControllerProtocol>
{
    UIButton *centerBtn;
}
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
    UIStoryboard *main2=[UIStoryboard storyboardWithName:@"Storyboard3" bundle:[NSBundle mainBundle]];
    
    //
    UIViewController *vc1=[main instantiateViewControllerWithIdentifier:@"main"];//根据storyboard和controller的storyId找到控制器
//    vc1.tabBarItem.title = @"111";
    vc1.tabBarItem.image = [UIImage imageNamed:@"ico_fenlei_01"];
    vc1.tabBarItem.selectedImage = [[UIImage imageNamed:@"ico_fenlei_02"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIViewController *vc2=[main1 instantiateViewControllerWithIdentifier:@"main"];
//    vc2.tabBarItem.title = @"222";
//    vc2.tabBarItem.image = [UIImage imageNamed:@"ico_shouye_01"];
//    vc2.tabBarItem.selectedImage = [[UIImage imageNamed:@"ico_shouye_02"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    
    UIViewController *vc3=[main2 instantiateViewControllerWithIdentifier:@"NavigationController"];
//    vc3.tabBarItem.title = @"333";
    vc3.tabBarItem.image = [UIImage imageNamed:@"ico_wode_01"];
    vc3.tabBarItem.selectedImage = [UIImage imageNamed:@"ico_wode_02"];
    
    [vcs addObject:vc1];
    [vcs addObject:vc2];
    [vcs addObject:vc3];
    
//    self.tabBar.tintColor = [UIColor redColor];
    
    centerBtn = [[UIButton alloc] init];
    centerBtn.center = CGPointMake(self.tabBar.center.x, self.tabBar.bounds.size.height/2 - 5);
    centerBtn.bounds = CGRectMake(0, 0, 60, 60);
    [centerBtn setImage:[UIImage imageNamed:@"ico_shouye_01"] forState:UIControlStateNormal];
    [centerBtn setImage:[UIImage imageNamed:@"ico_shouye_02"] forState:UIControlStateHighlighted];
    [centerBtn setImage:[UIImage imageNamed:@"ico_shouye_02"] forState:UIControlStateSelected];
    [centerBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBar addSubview:centerBtn];
    
    self.delegate = self;
    [self setViewControllers:vcs animated:NO];//用当前的viewController数组替换原本的tabbarControlle的 viewControllers数组
    self.selectedIndex = 0;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    BOOL logined = [[[NSUserDefaults standardUserDefaults] objectForKey:USER_LOGINED] intValue];
    if (!logined) {
    
        Login_VC *loginVC = [[Login_VC alloc] initWithNibName:@"Login_VC" bundle:nil];
        loginVC.delegate = self;
        [self presentViewController:loginVC animated:YES completion:nil];
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)clickBtn:(id) sender{
    UIButton *sen = (UIButton *)sender;
    self.selectedIndex = 1;
    sen.selected = YES;
}

-(void)presentingViewControllerDidClickedDismissButton:(UIViewController *)viewController{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITabBarControllerDelegate
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    DLog(@"🐶🐶🐶🐶🐶🐶");
}
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    DLog(@"🌻🌻🌻🌻🌻🌻");
    if (self.selectedIndex != 1) {
        centerBtn.selected = NO;
    }else{
        centerBtn.selected = YES;
    }
}

@end
