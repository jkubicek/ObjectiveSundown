//
//  TestObjectiveSundown.m
//  ObjectiveSundown
//
//  Created by Jim Kubicek on 11/19/12.
//  Copyright (c) 2012 Jim Kubicek. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ObjectiveSundown.h"

@interface ObjectiveSundownTest : XCTestCase

@end

@implementation ObjectiveSundownTest

#pragma mark - Setup / Teardown

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

#pragma mark - Helper Methods

- (NSString *)makeParagraphFromString:(NSString *)input
{
    return [NSString stringWithFormat:@"<p>%@</p>\n", input];
}

- (void)genericSingleLineTest:(NSString *)input
{
    NSString *outputHTML = [ObjectiveSundown parseMarkdownString:input];
    NSString *intendedOutputHTML = [self makeParagraphFromString:input];
    XCTAssertEqualObjects(outputHTML, intendedOutputHTML);

}

#pragma mark - Tests

- (void)testParse
{
    [self genericSingleLineTest:@"intput"];
}

- (void)testExtendedCharacters
{
    [self genericSingleLineTest:@"∫"];
}

- (void)testEmoji
{
    [self genericSingleLineTest:@"💀"];
}

- (void)testLinks
{
    NSString *input = @"http://www.dude.com";
    NSString *output = [ObjectiveSundown parseMarkdownString:input];
    NSString *expectedOutput = [NSString stringWithFormat:@"<p><a href=\"%@\">%@</a></p>\n", input, input];
    XCTAssertEqualObjects(output, expectedOutput);
}

@end
