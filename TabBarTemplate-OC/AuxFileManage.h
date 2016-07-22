//
//  AuxFileManage.h
//  TabBarTemplate-OC
//
//  Created by issuser on 16/5/11.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AuxFileManage : NSObject

/** 在Documents目录下新建文件
 *  fileName 创建的文件名
 *  toCreate 文件不存在是否需要创建
 *  Return  文件的完整路径
 */
+(NSString *) getPathForFileName:(NSString *)fileName toCreate:(BOOL)flag;

/** 在Documents目录下新建目录和文件
 * fileName 创建的文件名
 * component 创建文件所在的子目录
 *  toCreate 文件不存在是否需要创建
 * Return  文件的完整路径
 */
+(NSString *) getPathForFileName:(NSString *)fileName Component:(NSString *)component toCreate:(BOOL)flag;

/** 获取APP的HOME路径
 *
 * Return  Documents路径
 */
+(NSString *) getHomePath;

/** 获取APP的Cache路径
 *
 * Return  Cache路径
 */
+(NSString *) getCachesPath;
@end
