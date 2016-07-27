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


@property (nonatomic, strong) IBOutlet UIImageView* loadImageView;
@property (nonatomic, strong) IBOutlet UILabel* label;

@property (nonatomic, strong) NSString* imageURLString;
@property (nonatomic, strong) NSString* lessImageURL;
@end
