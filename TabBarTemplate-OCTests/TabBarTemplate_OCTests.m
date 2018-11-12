//
//  TabBarTemplate_OCTests.m
//  TabBarTemplate-OCTests
//
//  Created by issuser on 16/5/11.
//  Copyright © 2016年 isoftston. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SJLMathematicsTool.h"

@interface TabBarTemplate_OCTests : XCTestCase

@end

@implementation TabBarTemplate_OCTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
//    CFShow(@"111111111");
    NSLog(@"初始化测试数据");
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    NSLog(@"测试完成");
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSLog(@"-------------%@",[SJLMathematicsTool wantDecimalWithFormat:@"0.00" floatValue:12.345678]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
