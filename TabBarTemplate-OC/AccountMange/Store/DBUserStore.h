//
//  DBUserStore.h
//  TabBarTemplate-OC
//
//  Created by 索静龙 on 2018/11/7.
//  Copyright © 2018 suojl. All rights reserved.
//
#import "DBQueueBaseStore.h"

NS_ASSUME_NONNULL_BEGIN

@class UserModel;
@interface DBUserStore : DBQueueBaseStore

/**
 *  更新用户信息
 */
- (BOOL)updateUser:(UserModel *)user;

/**
 *  更新用户信息
 */
- (BOOL)updateUsers:(NSArray<UserModel *> *)users;
/**
 *  获取用户信息
 */
- (UserModel *)userByID:(NSString *)userID;

/**
 *  查询所有用户
 */
- (NSArray *)userData;

/**
 *  删除用户
 */
- (BOOL)deleteUsersByUid:(NSString *)uid;
@end

NS_ASSUME_NONNULL_END
