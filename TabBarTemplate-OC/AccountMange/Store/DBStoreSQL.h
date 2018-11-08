//
//  DBStoreSQL.h
//  TabBarTemplate-OC
//
//  Created by 索静龙 on 2018/11/7.
//  Copyright © 2018 suojl. All rights reserved.
//

#ifndef DBStoreSQL_h
#define DBStoreSQL_h

#define     USER_TABLE_NAME                 @"users"

#define     SQL_CREATE_USER_TABLE           @"CREATE TABLE IF NOT EXISTS %@(\
uid TEXT,\
username TEXT,\
nikename TEXT, \
avatar TEXT,\
remark TEXT,\
ext1 TEXT,\
ext2 TEXT,\
ext3 TEXT,\
ext4 TEXT,\
ext5 TEXT,\
PRIMARY KEY(uid))"

#define     SQL_UPDATE_USER                 @"REPLACE INTO %@ ( uid, username, nikename, avatar, remark, ext1, ext2, ext3, ext4, ext5) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"

#define     SQL_SELECT_USER_BY_ID           @"SELECT * FROM %@ WHERE uid = %@"

#define     SQL_SELECT_USERS                @"SELECT * FROM %@"

#define     SQL_DELETE_USER                 @"DELETE FROM %@ WHERE uid = %@"

#endif /* DBStoreSQL_h */
