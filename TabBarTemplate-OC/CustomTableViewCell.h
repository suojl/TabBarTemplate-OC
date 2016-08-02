//
//  CustomTableViewCell.h
//  TabBarTemplate-OC
//
//  Created by issuser on 16/7/26.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"

@interface CustomTableViewCell : UITableViewCell

typedef void (^ReloadTableCell) (NSIndexPath*);


@property (nonatomic, strong) IBOutlet UIImageView* loadImageView;
@property (nonatomic, strong) IBOutlet UILabel* label;
@property (nonatomic, strong) IBOutlet UIButton* moreBtn;

@property (nonatomic, strong) NSString* imageURLString;
@property (nonatomic, strong) NSString* lessImageURL;

@property (nonatomic, strong) NSIndexPath* indexPath;
@property (nonatomic, copy) ReloadTableCell reloadCell;

-(IBAction)moreClick:(id)sender;
@end
