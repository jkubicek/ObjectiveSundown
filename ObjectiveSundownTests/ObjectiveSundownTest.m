//
//  TestObjectiveSundown.m
//  ObjectiveSundown
//
//  Created by Jim Kubicek on 11/19/12.
//  Copyright (c) 2012 Jim Kubicek. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "ObjectiveSundown.h"

@interface ObjectiveSundownTest : SenTestCase

@end

@implementation ObjectiveSundownTest

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

- (void)testParse
{
    NSString *inputMarkdown = @"input string";
    NSString *outputHTML = [ObjectiveSundown parseMarkdownString:inputMarkdown];
    NSString *intendedOutputHTML = [NSString stringWithFormat:@"<p>%@</p>\n", inputMarkdown];
    STAssertEqualObjects(outputHTML, intendedOutputHTML, nil);
}

@end
