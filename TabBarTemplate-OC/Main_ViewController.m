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
#import "CellStatusEntity.h"

@interface Main_ViewController () <UITableViewDataSource,UITableViewDelegate>
{
    UIView* _view1;
    NSArray* _imagesRULArr;
    NSArray* _minImageURL;
    
    NSMutableArray* _cellInfoArr;
    
    AFNetworkReachabilityManager *_networkManager;
    NSMutableDictionary* _offscreenCells;
}
@end

@implementation Main_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _cellInfoArr = [[NSMutableArray alloc] initWithCapacity:10];
    _networkManager = [AFNetworkReachabilityManager sharedManager];
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
    self.tableView.rowHeight = UITableViewAutomaticDimension;// iOS8 tableViewCell自适应高度
    self.tableView.estimatedRowHeight = 200.0; // 预估Cell的高度,
    
    [_imagesRULArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * stop) {
        CellStatusEntity* cellEntity = [[CellStatusEntity alloc] init];
        cellEntity.showAllLines = NO;
        [_cellInfoArr addObject:cellEntity];
    }];

//    _offscreenCells = [[NSMutableDictionary alloc] initWithCapacity:5];
//    [_offscreenCells setObject:[self.tableView dequeueReusableCellWithIdentifier:@"CustomCell"] forKey:@"offScreenCells"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
//    [self.tableView reloadData];
}

#pragma mark- UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _imagesRULArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    CustomTableViewCell* cell =[self.tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    
    cell.cellIndexPath = indexPath;
    NSString* imageURLString = _imagesRULArr[indexPath.row];
    
    if (!cell.reloadCellBlock) {
        __block typeof(self) weakSelf = self;
        cell.reloadCellBlock = ^(NSIndexPath* cellIndexPath){
            CellStatusEntity* cellStatus = weakSelf.cellInfoArr[cellIndexPath.row];
            cellStatus.showAllLines = !cellStatus.showAllLines;
            DLog(@"xxxxxxxxxxxxxx%ld",cellIndexPath.row);
            [weakSelf.tableView reloadRowsAtIndexPaths:@[cellIndexPath] withRowAnimation:UITableViewRowAnimationNone];
        };
    }
    
    UIImage* cellImage = nil;
//    SDWebImageManager *sdw = [SDWebImageManager sharedManager];
    SDImageCache *imageCache = [SDImageCache sharedImageCache];
    cellImage = [imageCache imageFromDiskCacheForKey:imageURLString];
    if (cellImage) {
        cell.loadImageView.image = cellImage;
    }else {
        if ([_networkManager isReachableViaWiFi]) {
            DLog(@"当前处于WiFi环境下!!!");
            cell.imageURLString = imageURLString;
        }
        if ([_networkManager isReachableViaWWAN]) {
            DLog(@"当前处于WWAN环境下!!!");
            cell.lessImageURL = _minImageURL[0];
        }
    }
    
    CellStatusEntity* cellStatus = self.cellInfoArr[indexPath.row];
    if (cellStatus.showAllLines) {
        cell.label.numberOfLines = 0;
    }else{
        cell.label.numberOfLines = 3;
    }
    
    cell.label.text = [NSString stringWithFormat:@"考得上几分氨基酸掉飞机接收到刷卡机大佛我驾驶的空间就圣诞节快捷 电视剧佛尔圣诞节佛为了撒娇的佛巨额玩傻大姐佛额外撒打发我几个考试费离开圣诞节佛为就 快速机动费文件四大皆空佛为福建啥都看见个is阿见附件-%ld-",(long)indexPath.row];
    return  cell;
}

#pragma mark UITableViewDelegate


//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    CustomTableViewCell* cell =[_offscreenCells objectForKey:@"offScreenCells"];
//    
//    NSString* imageURLString = _imagesRULArr[indexPath.row];
//    UIImage* cellImage = nil;
//    SDImageCache *imageCache = [SDImageCache sharedImageCache];
//    cellImage = [imageCache imageFromDiskCacheForKey:imageURLString];
//    if (cellImage) {
//        cell.loadImageView.image = cellImage;
//    }else {
//        if ([_networkManager isReachableViaWiFi]) {
//            DLog(@"当前处于WiFi环境下!!!");
//            cell.imageURLString = imageURLString;
//        }
//        if ([_networkManager isReachableViaWWAN]) {
//            DLog(@"当前处于WWAN环境下!!!");
//            cell.lessImageURL = _minImageURL[0];
//        }
//    }
//    
//    
//    cell.label.text = [NSString stringWithFormat:@"考得上几分氨基酸掉飞机接收到刷卡机大佛我驾驶的空间就圣诞节快捷 电视剧佛尔圣诞节佛为了撒娇的佛巨额玩傻大姐佛额外撒打发我几个考试费离开圣诞节佛为就 快速机动费文件四大皆空佛为福建啥都看见个is阿见附件-%ld-",indexPath.row];
//    CGSize size = [cell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
//    
//    return size.height + 1;
//}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DLog(@"---------%ld",indexPath.row);
}

//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 0;
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 0;
//}
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    return [[UIView alloc] init];
//}

//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    return [[UIView alloc] init];
//}

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
