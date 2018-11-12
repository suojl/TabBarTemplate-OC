//
//  DBQueueBaseStore.h
//  TabBarTemplate-OC
//
//  Created by 索静龙 on 2018/11/7.
//  Copyright © 2018 suojl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDBDataManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface DBQueueBaseStore : NSObject

/// 数据库操作队列(从TLDBManager中获取，默认使用commonQueue)
@property (nonatomic, weak) FMDatabaseQueue *dbQueue;

/**
 *  表创建
 */
- (BOOL)createTable:(NSString*)tableName withSQL:(NSString*)sqlString;

/*
 *  执行带数组参数的sql语句 (增，删，改)
 */
-(BOOL)executeSQL:(NSString*)sqlString withArrParameter:(NSArray*)arrParameter;

/*
 *  执行带字典参数的sql语句 (增，删，改)
 */
-(BOOL)executeSQL:(NSString*)sqlString withDicParameter:(NSDictionary*)dicParameter;

/*
 *  执行格式化的sql语句 (增，删，改)
 */
- (BOOL)executeSQL:(NSString *)sqlString,...;

/**
 使用事务处理重复操作 (增，删，改)
 
 @param sqlString 重复操作执行的SQL
 @param parametersArray SQL执行需要的参数列表
 @return 执行结果
 */
- (BOOL)transactionExecuteSQL:(NSString *)sqlString withArray:(NSArray<NSArray *> *)parametersArray;

/**
 使用事务处理批量操作 (增，删，改)

 @param sqlArray 批量操作执行的SQL
 @param parametersArray SQL执行需要的参数列表
 @return 执行结果
 */
- (BOOL)transactionExecuteSQLArray:(NSArray<NSString *> *)sqlArray withparametersArray:(NSArray<NSArray *> *)parametersArray;

/**
 *  执行查询指令
 */
- (void)executeQuerySQL:(NSString*)sqlStr resultBlock:(void(^)(FMResultSet * rsSet))resultBlock;
@end

NS_ASSUME_NONNULL_END
