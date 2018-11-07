//
//  CommonTool.h
//  TabBarTemplate-OC
//
//  Created by issuser on 16/7/27.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonTool : NSObject

/** 
 *  格式化小数 (四舍五入)
 *
 * @param format 目标格式 (eg :@"0.00")
 * @param floatV 原始数据
 *
 * @return 格式化结果
 */
- (NSString *) decimalwithFormat:(NSString *)format  floatValue:(float)floatV;
@end
