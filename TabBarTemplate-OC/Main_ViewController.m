//
//  Main_ViewController.m
//  TabBarTemplate-OC
//
//  Created by issuser on 16/6/2.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import "Main_ViewController.h"
#import "CustomTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface Main_ViewController () <UITableViewDataSource,UITableViewDelegate>
{
    UIView* _view1;
    NSArray* _imagesRULArr;
    NSArray* _minImageURL;
}
@end

@implementation Main_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imagesRULArr = @[@"http://www.pptbz.com/pptpic/UploadFiles_6909/201110/20111014111307895.jpg"
                      ,@"http://pic.pptbz.com/pptpic/201505/2015052211012624.jpg"
                      ,@"http://pic.pptbz.com/pptpic/201105/2011051907233671.jpg"
                      ,@"http://pic.pptbz.com/pptpic/201501/2015010511413922.jpg"
                      ,@"http://pic.pptbz.com/pptpic/201312/2013120906490666.jpg"
                      ,@"http://pic.pptbz.com/pptpic/201401/2014010920425522.jpg"
                      ,@"http://pic.pptbz.com/pptpic/201208/2012081320100052.jpg"
                      ,@"http://pic.pptbz.com/pptpic/201303/2013032521245830.jpg"
                      ,@"http://pic.pptbz.com/pptpic/201111/20111126180705869.jpg"];
    _minImageURL = @[@"http://pic.pptbz.com/pptpic/201312/2013120906490666_S.jpg",
                     @"http://pic.pptbz.com/pptpic/201401/2014010920425522_S.jpg",
                     @"http://pic.pptbz.com/pptpic/201208/2012081320100052_S.jpg",
                     @"http://pic.pptbz.com/pptpic/201303/2013032521245830_S.jpg"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    [self.tableView reloadData];
}

#pragma mark- UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _imagesRULArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AFNetworkReachabilityManager *ada = [AFNetworkReachabilityManager sharedManager];
    
    CustomTableViewCell* cell =[self.tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    NSString* imageURLString = _imagesRULArr[indexPath.row];
    
    UIImage* cellImage = nil;
    SDImageCache *imageCache = [SDImageCache sharedImageCache];
//    [imageCache queryDiskCacheForKey:imageURLString done:^(UIImage *image2,SDImageCacheType cacheType) {
//        if (image2) {
//            [cell.loadImageView sd_cancelCurrentImageLoad];
//            cell.loadImageView.image = image2;
//            cellImage = image2;
//        }
//    }];
    cellImage = [imageCache imageFromDiskCacheForKey:imageURLString];
    if (cellImage) {
        cell.loadImageView.image = cellImage;
    }else {
        if ([ada isReachableViaWiFi]) {
            DLog(@"当前处于WiFi环境下!!!");
            cell.imageURLString = imageURLString;
        }
        if ([ada isReachableViaWWAN]) {
            DLog(@"当前处于WWAN环境下!!!");
            cell.lessImageURL = _minImageURL[0];
        }
    }
    
    
    cell.label.text = [NSString stringWithFormat:@"-%ld-",indexPath.row];
    return  cell;
}

#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DLog(@"---------%ld",indexPath.row);
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    return [[UIView alloc] init];
//}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UIView alloc] init];
}

#pragma mark -
- (IBAction)unwindTab3Segue:(UIStoryboardSegue *)sender{
    NSLog(@"unwindSegue %@", sender);
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
