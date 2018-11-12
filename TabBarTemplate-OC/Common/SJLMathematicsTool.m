//
//  SJLMathematicsTool.m
//  TabBarTemplate-OC
//
//  Created by 索静龙 on 2018/11/7.
//  Copyright © 2018 suojl. All rights reserved.
//

#import "SJLMathematicsTool.h"

@implementation SJLMathematicsTool

//格式话小数 四舍五入类型
+ (NSString *) wantDecimalWithFormat:(NSString *)format  floatValue:(float)floatV
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    
    [numberFormatter setPositiveFormat:format];
    
    return  [numberFormatter stringFromNumber:[NSNumber numberWithFloat:floatV]];
}
@end
