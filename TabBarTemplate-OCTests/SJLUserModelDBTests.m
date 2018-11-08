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

@interface SJLUserModelDBTests : XCTestCase

@end

@implementation SJLUserModelDBTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    UserModel *user = [UserModel new];
    user.userID = @"id123456";
    user.username = @"username";
    user.nikeName = @"nikeName";
    user.avatarURL = @"http://www.baidu.com";
    user.remarkName = @"测试数据";
    
    DBUserStore *userStore = [DBUserStore new];
    for (int i = 0; i< 10; i++) {
        user.userID = [NSString stringWithFormat:@"id123456%d",i];
        [userStore updateUser:user];
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
