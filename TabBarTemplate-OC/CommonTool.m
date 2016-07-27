//
//  CommonTool.m
//  TabBarTemplate-OC
//
//  Created by issuser on 16/7/27.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import "CommonTool.h"

@implementation CommonTool

//格式话小数 四舍五入类型
- (NSString *) decimalwithFormat:(NSString *)format  floatValue:(float)floatV
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    
    [numberFormatter setPositiveFormat:format];
    
    return  [numberFormatter stringFromNumber:[NSNumber numberWithFloat:floatV]];
}
@end
