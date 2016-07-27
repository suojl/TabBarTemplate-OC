//
//  CustomTableViewCell.m
//  TabBarTemplate-OC
//
//  Created by issuser on 16/7/26.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface CustomTableViewCell ()
{
    NSString* _imageURLString;
}


@end

@implementation CustomTableViewCell

@synthesize imageURLString = _imageURLString;
@synthesize lessImageURL = _lessImageURL;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
//    DLog(@"---------------------------------");
    // Configure the view for the selected state
}

-(void)setImageURLString:(NSString *)imageURLString{

    _imageURLString = imageURLString;
    
    [self.loadImageView setShowActivityIndicatorView:YES];
    [self.loadImageView sd_setImageWithURL:[NSURL URLWithString:imageURLString]placeholderImage:[UIImage imageNamed:@"img_04"]];
    
}

-(void)setLessImageURL:(NSString *)lessImageURL{
    
    _lessImageURL = lessImageURL;
    
    [self.loadImageView setShowActivityIndicatorView:YES];
    [self.loadImageView sd_setImageWithURL:[NSURL URLWithString:lessImageURL]placeholderImage:[UIImage imageNamed:@"img_04"]];
   
}

@end
