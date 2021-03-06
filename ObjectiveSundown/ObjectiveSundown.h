//
//  ObjectiveSundown.h
//  ObjectiveSundown
//
//  Created by Jim Kubicek on 11/19/12.
//  Copyright (c) 2012 Jim Kubicek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectiveSundown : NSObject

/**
 * Parses an input markdown string into an output HTML string
 */
+ (NSString *)parseMarkdownString:(NSString *)markdown;

@end
