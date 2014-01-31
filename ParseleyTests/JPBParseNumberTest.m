//
//  JPBParseNumberTest.m
//  Parseley
//
//  Created by John Beatty on 1/30/14.
//  Copyright (c) 2014 John Beatty. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JPBParseNumber.h"

@interface JPBParseNumberTest : XCTestCase

@end

@implementation JPBParseNumberTest

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
    
   
    
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testSingleDigits
{
    
    NSArray * inputs = @[@(1), @(5), @(9), @(0)];
    NSArray * expectedResults = @[@"one", @"five", @"nine", @"zero"];
    
    [inputs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *result = [JPBParseNumber parseInteger:[obj integerValue]];
        
        XCTAssertEqualObjects( result, expectedResults[idx], @"%@ should equal %@ instead of %@", inputs[idx], expectedResults[idx], result);
    }];
}

- (void)testDoubleDigits
{
    NSArray * inputs = @[@(10), @(11), @(55), @(90), @(98)];
    NSArray * expectedResults = @[@"ten", @"eleven", @"fifty-five", @"ninety", @"ninety-eight"];
    
    [inputs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *result = [JPBParseNumber parseInteger:[obj integerValue]];
        
        XCTAssertEqualObjects( result, expectedResults[idx], @"%@ should equal %@ instead of %@", inputs[idx], expectedResults[idx], result);
    }];
}

- (void)testTripleDigits
{
    NSArray * inputs = @[@(100), @(110), @(555), @(901), @(918)];
    NSArray * expectedResults = @[@"one hundred", @"one hundred ten", @"five hundred fifty-five", @"nine hundred one", @"nine hundred eighteen"];
    
    [inputs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *result = [JPBParseNumber parseInteger:[obj integerValue]];
        
         XCTAssertEqualObjects( result, expectedResults[idx], @"%@ should equal %@ instead of %@", inputs[idx], expectedResults[idx], result);
    }];
}

- (void)testThousands
{
    NSArray * inputs = @[@(1000), @(2010), @(5555), @(9010), @(9918)];
    NSArray * expectedResults = @[@"one thousand", @"two thousand ten", @"five thousand five hundred fifty-five", @"nine thousand ten", @"nine thousand nine hundred eighteen"];
    
    [inputs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *result = [JPBParseNumber parseInteger:[obj integerValue]];
        
        XCTAssertEqualObjects( result, expectedResults[idx], @"%@ should equal %@ instead of %@", inputs[idx], expectedResults[idx], result);
    }];
}

- (void)testIllions
{
    NSArray * inputs = @[@(1000000),
                         @(1010101),
                         @(555555555),
                         @(9501010),
                         @(111911111),
                         @(NSIntegerMax),
                         @(NSIntegerMin + 1)];
    NSArray * expectedResults = @[@"one million",
                                  @"one million ten thousand one hundred one",
                                  @"five hundred fifty-five million five hundred fifty-five thousand five hundred fifty-five",
                                  @"nine million five hundred one thousand ten",
                                  @"one hundred eleven million nine hundred eleven thousand one hundred eleven",
                                  @"two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven",
                                  @"negative two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven"];
    
    [inputs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *result = [JPBParseNumber parseInteger:[obj integerValue]];
        
        XCTAssertEqualObjects( result, expectedResults[idx], @"%@ should equal %@ instead of %@", inputs[idx], expectedResults[idx], result);
    }];
}

- (void)testNegativity
{
    NSArray * inputs = @[@(-1),
                         @(-1010101),
                         @(555555555),
                         @(-950),
                         @(-11)];
    NSArray * expectedResults = @[@"negative one",
                                  @"negative one million ten thousand one hundred one",
                                  @"five hundred fifty-five million five hundred fifty-five thousand five hundred fifty-five",
                                  @"negative nine hundred fifty",
                                  @"negative eleven"];
    
    [inputs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *result = [JPBParseNumber parseInteger:[obj integerValue]];
        
        XCTAssertEqualObjects( result, expectedResults[idx], @"%@ should equal %@ instead of %@", inputs[idx], expectedResults[idx], result);
    }];
}

@end
