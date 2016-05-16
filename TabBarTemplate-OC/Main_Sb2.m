//
//  Main_Sb2.m
//  TabBarTemplate-OC
//
//  Created by issuser on 16/5/12.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import "Main_Sb2.h"
#import "DGAaimaView.h"

@interface Main_Sb2 (){
    
    DGAaimaView *animaView;
}

@end

@implementation Main_Sb2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //引入文件  用下面的方法控制各个空间的速度
    
//    animaView = [[DGAaimaView alloc]initWithFrame:self.view.bounds];
//    [self.view addSubview:animaView];
//    [animaView DGAaimaView:animaView BigCloudSpeed:1.5 smallCloudSpeed:1 earthSepped:1.0 huojianSepped:2.0 littleSpeed:2];
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
