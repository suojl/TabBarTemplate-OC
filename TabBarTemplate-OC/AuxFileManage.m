//
//  AuxFileManage.m
//  TabBarTemplate-OC
//
//  Created by issuser on 16/5/11.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import "AuxFileManage.h"

@implementation AuxFileManage

+(NSString *)getPathForFileName:(NSString *)fileName makeSureExists:(BOOL)flag{
    NSString * filePath = [[NSHomeDirectory() stringByAppendingPathComponent:@"/Documents"] stringByAppendingPathComponent:fileName];
    
    if (flag && ![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
    }
    return filePath;
}


+(NSString *) getPathForFileName:(NSString *)fileName Component:(NSString *)component makeSureExists:(BOOL)flag{
    
    NSString *homePath = [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents"];
    
    NSString *directoryPath = [homePath stringByAppendingPathComponent:component];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:directoryPath isDirectory:nil]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:directoryPath withIntermediateDirectories:YES
                                                   attributes:nil error:nil];
    }
    
    NSString * pathDB = [directoryPath stringByAppendingPathComponent:fileName];
    
    if (flag && ![[NSFileManager defaultManager] fileExistsAtPath:pathDB]) {
        [[NSFileManager defaultManager] createFileAtPath:pathDB contents:nil attributes:nil];
    }
    return pathDB;
}

+(NSString *) getHomePath{
    
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

+(NSString *) getCachesPath{
    
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}
@end
