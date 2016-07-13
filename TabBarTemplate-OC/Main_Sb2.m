//
//  Main_Sb2.m
//  TabBarTemplate-OC
//
//  Created by issuser on 16/5/12.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import "Main_Sb2.h"

@interface Main_Sb2 () <UITextFieldDelegate>{
    
}

@property (nonatomic, strong) IBOutlet UIScrollView* scroView;
@end

@implementation Main_Sb2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

-(void) viewDidAppear:(BOOL)animated{
    
    [self setUpScrollView];
}
-(void)setUpScrollView{
    
    NSLog(@"--%lf,--%lf",self.scroView.frame.size.height,self.scroView.frame.size.width);
    CGFloat heightScroll = self.scroView.frame.size.height;
    self.scroView.contentSize = CGSizeMake(3 * ScreenWidth, self.scroView.frame.size.height);
    UIView* redView = [UIView new];
    [redView setFrame:CGRectMake(0, 0, ScreenWidth, heightScroll)];
    redView.backgroundColor = [UIColor redColor];
    UIView* greenView = [[UIView alloc] initWithFrame:CGRectMake(ScreenWidth, 0, ScreenWidth, heightScroll)];
    greenView.backgroundColor = [UIColor greenColor];
    UIView* blueView = [[UIView alloc] initWithFrame:CGRectMake(2 * ScreenWidth, 0, ScreenWidth, heightScroll)];
    blueView.backgroundColor = [UIColor blueColor];
    [self.scroView addSubview:redView];
    [self.scroView addSubview:greenView];
    [self.scroView addSubview:blueView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)abcd:(id)sender{
    DLog(@"111111");
}
-(IBAction)abcde:(id)sender{
    DLog(@"222222");
}


- (IBAction)unwindToMain_SB2:(UIStoryboardSegue *)sender{

    DLog(@"------打印内容!!!-------");
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
