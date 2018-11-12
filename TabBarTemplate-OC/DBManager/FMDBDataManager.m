//
//  AuxDBOperation.m
//  TabBarTemplate-OC
//
//  Created by issuser on 16/5/11.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import "FMDBDataManager.h"
#import "AuxFileManage.h"

@implementation FMDBDataManager



+(instancetype) sharedDBMInstance{
    
    static FMDBDataManager *sharedDBOperation;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        NSString * path = [AuxFileManage getPathForFileName:@"FMDBTest.db" makeSureExists:NO];
        DDLogInfo(path);
        
        /* create dataTable BY Existing */
//        if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
//            NSLog(@"数据库文件不存在!!!");
//            NSString* dbPath = [[NSBundle mainBundle] pathForResource:@"FMDBTest" ofType:@"db"];
//            [[NSFileManager defaultManager] copyItemAtPath:dbPath toPath:path error:nil];
//        }
        
        sharedDBOperation = [[FMDBDataManager alloc] initWithPath:path];
        if (![sharedDBOperation.fmdb open]) {
            DDLogWarn(@"---数据库打开失败!!!---");
        }
        /* create dataTable BY Existing */
        
        /* create dataTable BY Code */
        
        //        NSString * creatTable = @"create table if not exists table1 (id integer primary key autoincrement, name text,age integer);"
        //        "create table if not exists table2 (id integer primary key autoincrement, name text,age integer);"
        //        "create table if not exists table3 (id integer primary key autoincrement, name text,age integer);";
        //
        //        BOOL isCreate = [sharedDBOperation.fmdb executeStatements:creatTable];
        //        if (isCreate) {
        //            NSLog(@"数据库创建完成！");
        //        }
        //        [sharedDBOperation.fmdb close];
        /* create dataTable BY Code */
    });
    return sharedDBOperation;
}

+ (instancetype)sharedInstanceWithQueue {
    static FMDBDataManager *sharedDBOperation;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        NSString * path = [AuxFileManage getPathForFileName:@"FMDBQueueTest.db" makeSureExists:NO];
        DDLogInfo(path);
        /* create dataTable BY Existing */
//        if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
//            NSLog(@"数据库文件不存在!!!");
//            NSString* dbPath = [[NSBundle mainBundle] pathForResource:@"FMDBTest" ofType:@"db"];
//            [[NSFileManager defaultManager] copyItemAtPath:dbPath toPath:path error:nil];
//        }
        sharedDBOperation = [[FMDBDataManager alloc] initWithDBPath:path];
    });
    return sharedDBOperation;
}

- (id)init
{
    DDLogError(@"FMDBDataManager:不能调用init创建对象，请使用单例方法获取");
    NSAssert(FALSE, @"FMDBDataManager 不能调用init创建对象，请使用单例方法获取。");
    return nil;
}

-(id)initWithPath:(NSString *)path{
    self = [super init];
    if (self) {
        self.fmdb = [FMDatabase databaseWithPath:path];
    }
    return self;
}

-(id)initWithDBPath:(NSString *)path{
    self = [super init];
    if (self) {
        self.commonDBQueue = [FMDatabaseQueue databaseQueueWithPath:path];
    }
    return self;
}

-(BOOL) addInfo:(NSArray *)arr{
    NSString * sql = @"insert into table1(name,age) values ('墨子',2000);"
    "insert into table1(name,age) values ('老子',2500);"
    "insert into table1(name,age) values ('韩非子',2500);"
    "insert into table1(name,age) values ('孙子',2350);"
    "insert into table1(name,age) values ('秦始皇',2259);"
    "insert into table1(name,age) values ('叫花子',1200);"
    "insert into table1(name,age) values ('瞎子',1200);";
    
    //    return [self executeUpdate:sql];
    return [self executeStatements:sql];
}
-(BOOL) deleteInfo:(NSArray *)arr{
    NSString * sql = @"delete from table1 where name = '瞎子' ";
    
    return [self executeUpdate:sql];
}
-(BOOL) updateInfo:(NSArray *)arr{
    NSString * sql = @"update table1  set name = '天子' , age = 2200 where name = '叫花子'";
    
    return [self executeUpdate:sql];
}
-(NSArray *) searchInfo:(NSArray *)arr{
    NSString * sql = @"select * from table1";
    NSArray * array = [self executeQuery:sql];
    for (NSDictionary *dic in array) {
        NSLog(@"---name: %@----年龄: %@",[dic objectForKey:@"name"],[dic objectForKey:@"age"]);
    }
    return array;
}

// 单条信息更新
-(BOOL)executeUpdate:(NSString *)sql{
    BOOL isSuccesss = [self.fmdb executeUpdate:sql];
    return isSuccesss;
}
// 批量信息更新(添加)
-(BOOL)executeStatements:(NSString *)staSql{
    BOOL isSuccesss = [self.fmdb executeStatements:staSql];
    return isSuccesss;
}

-(NSArray *)executeQuery:(NSString *)sql{
    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:10];
    FMResultSet * rs = [self.fmdb executeQuery:sql];
    while (rs.next) {
        NSMutableDictionary * dic = [[NSMutableDictionary alloc] initWithCapacity:2];
        NSString * name = [rs stringForColumn:@"name"];
        NSString * age = [rs stringForColumn:@"age"];
        
        [dic setObject:name forKey:@"name"];
        [dic setObject:age forKey:@"age"];
        
        [arr addObject:dic];
    }
    return arr;
}
@end
