//
//  DBQueueBaseStore.m
//  TabBarTemplate-OC
//
//  Created by 索静龙 on 2018/11/7.
//  Copyright © 2018 suojl. All rights reserved.
//

#import "DBQueueBaseStore.h"

@implementation DBQueueBaseStore

- (id)init
{
    if (self = [super init]) {
        self.dbQueue = [FMDBDataManager sharedInstanceWithQueue].commonDBQueue;
    }
    return self;
}

- (BOOL)createTable:(NSString *)tableName withSQL:(NSString *)sqlString
{
    __block BOOL ok = YES;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        if(![db tableExists:tableName]){
            ok = [db executeUpdate:sqlString withArgumentsInArray:@[]];
        }
    }];
    return ok;
}

- (BOOL)executeSQL:(NSString *)sqlString withArrParameter:(NSArray *)arrParameter
{
    __block BOOL ok = NO;
    if (self.dbQueue) {
        [self.dbQueue inDatabase:^(FMDatabase *db) {
            ok = [db executeUpdate:sqlString withArgumentsInArray:arrParameter];
        }];
    }
    return ok;
}

- (BOOL)executeSQL:(NSString *)sqlString withDicParameter:(NSDictionary *)dicParameter
{
    __block BOOL ok = NO;
    if (self.dbQueue) {
        [self.dbQueue inDatabase:^(FMDatabase *db) {
            ok = [db executeUpdate:sqlString withParameterDictionary:dicParameter];
        }];
    }
    return ok;
}

- (BOOL)executeSQL:(NSString *)sqlString,...
{
    __block BOOL ok = NO;
    if (self.dbQueue) {
        va_list args;
        va_list *p_args;
        p_args = &args;
        va_start(args, sqlString);
        [self.dbQueue inDatabase:^(FMDatabase *db) {
            ok = [db executeUpdate:sqlString withVAList:*p_args];
        }];
        va_end(args);
    }
    return ok;
}

- (BOOL)transactionExecuteSQL:(NSString *)sqlString withArray:(NSArray<NSArray *> *)parametersArray{
    __block BOOL ok = NO;
    if (self.dbQueue) {
        [self.dbQueue inTransaction:^(FMDatabase * db, BOOL * rollback) {
            for (NSArray *parameterArray in parametersArray) {
                ok = [db executeUpdate:sqlString withArgumentsInArray:parameterArray];
                if (!ok) {
                    * rollback = YES;
                    return;
                }
            }
        }];
    }
    return ok;
}

- (BOOL)transactionExecuteSQLArray:(NSArray<NSString *> *)sqlArray withparametersArray:(NSArray<NSArray *> *)parametersArray{
    __block BOOL ok = NO;
    if (self.dbQueue) {
        [self.dbQueue inTransaction:^(FMDatabase * db, BOOL * rollback) {
            for (int i = 0; i < sqlArray.count; i++) {
                ok = [db executeUpdate:sqlArray[i] withArgumentsInArray:parametersArray[i]];
                if (!ok) {
                    * rollback = YES;
                    return;
                }
            }
        }];
    }
    return ok;
}

- (void)executeQuerySQL:(NSString*)sqlStr resultBlock:(void(^)(FMResultSet * rsSet))resultBlock
{
    if (self.dbQueue) {
        [_dbQueue inDatabase:^(FMDatabase *db) {
            FMResultSet * retSet = [db executeQuery:sqlStr];
            if (resultBlock) {
                resultBlock(retSet);
            }
        }];
    }
}
@end
