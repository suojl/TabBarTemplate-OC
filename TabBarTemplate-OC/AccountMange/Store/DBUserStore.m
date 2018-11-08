//
//  DBUserStore.m
//  TabBarTemplate-OC
//
//  Created by 索静龙 on 2018/11/7.
//  Copyright © 2018 suojl. All rights reserved.
//

#import "DBUserStore.h"
#import "DBStoreSQL.h"
#import "UserModel.h"

@implementation DBUserStore

- (instancetype)init
{
    self = [super init];
    if (self) {
        BOOL ok = [self createTable];
        if (!ok) {
            DDLogError(@"DB: 用户表创建失败!!!");
        }
    }
    return self;
}

- (BOOL) createTable{
    NSString *sqlString = [NSString stringWithFormat:SQL_CREATE_USER_TABLE,USER_TABLE_NAME];
    return [self createTable:USER_TABLE_NAME withSQL:sqlString];
}

- (BOOL)updateUser:(UserModel *)user{
    NSString *sqlString = [NSString stringWithFormat:SQL_UPDATE_USER, USER_TABLE_NAME];
    NSArray *arrPara = [NSArray arrayWithObjects:
                        user.userID,
                        user.username,
                        user.nikeName,
                        user.avatarURL,
                        user.remarkName,
                        @"", @"", @"", @"", @"", nil];
    BOOL ok = [self executeSQL:sqlString withArrParameter:arrPara];
    return ok;
}

- (UserModel *)userByID:(NSString *)userID{
    NSString *sqlString = [NSString stringWithFormat:SQL_SELECT_USER_BY_ID, USER_TABLE_NAME, userID];
    __block UserModel * user;
    [self executeQuerySQL:sqlString resultBlock:^(FMResultSet *retSet) {
        while ([retSet next]) {
            user = [self p_createUserByFMResultSet:retSet];
        }
        [retSet close];
    }];
    return user;
}

- (NSArray *)userData{
    __block NSMutableArray *data = [[NSMutableArray alloc] init];
    NSString *sqlString = [NSString stringWithFormat:SQL_SELECT_USERS, USER_TABLE_NAME];
    
    [self executeQuerySQL:sqlString resultBlock:^(FMResultSet *retSet) {
        while ([retSet next]) {
            UserModel *user = [self p_createUserByFMResultSet:retSet];
            [data addObject:user];
        }
        [retSet close];
    }];
    
    return data;
}

- (BOOL)deleteUsersByUid:(NSString *)uid{
    NSString *sqlString = [NSString stringWithFormat:SQL_DELETE_USER,USER_TABLE_NAME, uid];
    BOOL ok = [self executeSQL:sqlString,nil];
    return ok;
}

#pragma mark - # Private Methods
- (UserModel *)p_createUserByFMResultSet:(FMResultSet *)retSet
{
    UserModel *user = [[UserModel alloc] init];
    user.userID = [retSet stringForColumn:@"uid"];
    user.username = [retSet stringForColumn:@"username"];
    user.nikeName = [retSet stringForColumn:@"nikename"];
    user.avatarURL = [retSet stringForColumn:@"avatar"];
    user.remarkName = [retSet stringForColumn:@"remark"];
    return user;
}
@end
