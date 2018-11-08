//
//  AuxDBOperation.h
//  TabBarTemplate-OC
//
//  Created by issuser on 16/5/11.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB/FMDB.h>

@interface FMDBDataManager : NSObject

@property (nonatomic, strong) FMDatabase *fmdb;
@property (nonatomic, strong) FMDatabaseQueue *commonDBQueue;

/**
 非线程安全FMDatabase
 */
+(instancetype) sharedDBMInstance;

/**
 使用多线程安全FMDatabaseQueue
 */
+(instancetype) sharedInstanceWithQueue;


/**添加信息
 * @parameter (arr)
 * return BOOL
 */
-(BOOL) addInfo:(NSArray *)arr;
-(BOOL) deleteInfo:(NSArray *)arr;
-(BOOL) updateInfo:(NSArray *)arr;
-(NSArray *) searchInfo:(NSArray *)arr;

@end
