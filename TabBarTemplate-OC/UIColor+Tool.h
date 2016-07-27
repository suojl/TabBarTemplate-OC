//
//  UIColor+Tool.h
//  TabBarTemplate-OC
//
//  Created by issuser on 16/7/27.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Tool)

/** 
 * 颜色转换 IOS中十六进制的颜色转换为UIColor 
 *
 * @param color: (eg: #EFEFEF)
 */
+ (UIColor *) colorWithHexString: (NSString *)color;
@end
