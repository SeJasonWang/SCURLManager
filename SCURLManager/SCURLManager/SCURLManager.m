//
//  SCURLManager.m
//  SCURLManager
//
//  Created by sichenwang on 16/1/29.
//  Copyright © 2016年 sichenwang. All rights reserved.
//

#import "SCURLManager.h"
#import "SCURLHandlerBase.h"
#import "SCWebViewController.h"

static NSString *const kScheme = @"xxxx";

@implementation SCURLManager

+ (BOOL)openURL:(NSURL *)url {
    if ([url.scheme isEqualToString:kScheme]) {
        return [[SCURLHandlerBase handleURL:url] handle];
    } else if ([url.scheme isEqualToString:@"http"] || [url.scheme isEqualToString:@"https"]) {
        [SCWebViewController openURL:url animated:YES];
        return YES;
    } else {
        return [[UIApplication sharedApplication] openURL:url];
    }
}

@end
