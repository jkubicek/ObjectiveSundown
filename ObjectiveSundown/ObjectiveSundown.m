//
//  ObjectiveSundown.m
//  ObjectiveSundown
//
//  Created by Jim Kubicek on 11/19/12.
//  Copyright (c) 2012 Jim Kubicek. All rights reserved.
//

#import "ObjectiveSundown.h"

#import "markdown.h"
#import "html.h"
#import "buffer.h"

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define READ_UNIT 1024
#define OUTPUT_UNIT 64

@implementation ObjectiveSundown

+ (NSString *)parseMarkdownString:(NSString *)markdownString
{
    struct buf *ob;

    struct sd_callbacks callbacks;
	struct html_renderopt options;
	struct sd_markdown *markdown;

	/* performing markdown parsing */
	ob = bufnew(OUTPUT_UNIT);

	sdhtml_renderer(&callbacks, &options, 0);
	markdown = sd_markdown_new(0, 16, &callbacks, &options);

    const char *document = [markdownString UTF8String];
    size_t doc_size = strlen(document);
    
	sd_markdown_render(ob, (const uint8_t *)document, doc_size, markdown);
	sd_markdown_free(markdown);

    char *outputCString = malloc(ob->size + sizeof(char));
    memcpy(outputCString, ob->data, ob->size);
	NSString *outputString = [NSString stringWithCString:outputCString encoding:NSUTF8StringEncoding];

    return outputString;
}

@end
