//
//  CustomTableViewCell2.m
//  TabBarTemplate-OC
//
//  Created by issuser on 16/8/1.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import "CustomTableViewCell2.h"

@implementation CustomTableViewCell2

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)updateConstraints
{
    //    NSLog(@"%@",NSStringFromSelector(_cmd));
    [super updateConstraints];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.contentView layoutSubviews];
    
    if (self.titleLabel.numberOfLines == 0 && self.titleLabel.bounds.size.width != self.titleLabel.preferredMaxLayoutWidth) {
        self.titleLabel.preferredMaxLayoutWidth = self.titleLabel.bounds.size.width;
    }
    if (self.contentLabel.numberOfLines == 0 && self.contentLabel.bounds.size.width != self.contentLabel.preferredMaxLayoutWidth) {
        self.contentLabel.preferredMaxLayoutWidth = self.contentLabel.bounds.size.width;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
