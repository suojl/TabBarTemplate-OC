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
 * @param fileName 创建的文件名
 * @param toCreate 文件不存在是否需要创建
 * @return  文件的完整路径
 */
+(NSString *) getPathForFileName:(NSString *)fileName makeSureExists:(BOOL)flag;

/** 
 * 在Documents目录下新建目录和文件
 * @param fileName 创建的文件名
 * @param component 创建文件所在的子目录
 * @param toCreate 文件不存在是否需要创建
 * @return  文件的完整路径
 */
+(NSString *) getPathForFileName:(NSString *)fileName Component:(NSString *)component makeSureExists:(BOOL)flag;

/** 获取APP的HOME路径
 *
 * @return  Documents路径
 */
+(NSString *) getHomePath;

/** 获取APP的Cache路径
 *
 * @return  Cache路径
 */
+(NSString *) getCachesPath;
@end
