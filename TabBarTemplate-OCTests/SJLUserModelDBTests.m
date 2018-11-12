//
//  SJLUserModelDBTests.m
//  TabBarTemplate-OCTests
//
//  Created by 索静龙 on 2018/11/8.
//  Copyright © 2018 suojl. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DBUserStore.h"
#import "UserModel.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
@interface SJLUserModelDBTests : XCTestCase

@end

@implementation SJLUserModelDBTests
- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    NSLog(@"--------------------🐛🐛🐛🐛🐛🐛🐛--------------------");
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    NSLog(@"--------------------🐛🐛🐛🐛🐛🐛🐛--------------------");
}

/**
 测试添加数据
 */
- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    UserModel *user = [UserModel new];
    user.userID = @"id123456";
    user.username = @"username";
    user.nikeName = @"nikeName";
    user.avatarURL = @"http://www.baidu.com";
    user.remarkName = @"测试数据";
    user.userAge = 10;
    
    DBUserStore *userStore = [DBUserStore new];
    for (int i = 0; i< 10; i++) {
        user.userID = [NSString stringWithFormat:@"id123456%d",i];
        [userStore updateUser:user];
    }
}

/**
 测试查询
 */
- (void)testQueryExample{
    DBUserStore *userStore = [DBUserStore new];
    NSArray *datas = [userStore userData];
    for (UserModel *model in datas) {
        NSLog(@"userID:%@, username:%@, remarkName:%@, userAge:%ld",model.userID,model.username,model.remarkName,model.userAge);
    }
    
    UserModel *userModel = [userStore userByID:@"id1234560"];
    NSLog(@"------userID:%@, username:%@, remarkName:%@, userAge:%ld",userModel.userID,userModel.username,userModel.remarkName,userModel.userAge);
}

/**
 测试删除
 */
- (void)testDeleteModelExample {
    DBUserStore *userStore = [DBUserStore new];
    BOOL success = [userStore deleteUsersByUid:@"id1234561"];
    if (success) {
        NSArray *datas = [userStore userData];
        for (UserModel *model in datas) {
            NSLog(@"userID:%@, username:%@, remarkName:%@, userAge:%ld",model.userID,model.username,model.remarkName,model.userAge);
        }
    }
}

/**
 测试事务
 */
- (void)testUpdateModelsExample{
    DBUserStore *userStore = [DBUserStore new];
    NSArray *datas = [userStore userData];
    for (int i = 0; i < datas.count; i++) {
        UserModel *model = datas[i];
        if (i == 6) {
            model.userID = @"";
        } else {
            model.userAge = -29;
        }
    }
    BOOL success = [userStore updateUsers:datas];
    if (success) {
        NSArray *datas = [userStore userData];
        for (UserModel *model in datas) {
            NSLog(@"userID:%@, username:%@, remarkName:%@, userAge:%ld",model.userID,model.username,model.remarkName,model.userAge);
        }
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
