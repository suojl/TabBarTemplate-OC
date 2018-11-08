//
//  SJLMathematicsTool.h
//  TabBarTemplate-OC
//
//  Created by 索静龙 on 2018/11/7.
//  Copyright © 2018 suojl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SJLMathematicsTool : NSObject

/**
 *  格式化小数 (四舍五入)
 *
 * @param format 目标格式 (eg :@"0.00")
 * @param floatV 原始数据
 *
 * @return 格式化结果
 */
+ (NSString *) wantDecimalWithFormat:(NSString *)format  floatValue:(float)floatV;
@end

NS_ASSUME_NONNULL_END
