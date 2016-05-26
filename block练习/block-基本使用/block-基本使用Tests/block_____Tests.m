//
//  block_____Tests.m
//  block-基本使用Tests
//
//  Created by lovepeijun on 16/5/26.
//  Copyright © 2016年 lovepeijun. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface block_____Tests : XCTestCase

@end

@implementation block_____Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
