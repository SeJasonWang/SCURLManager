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

NSString *const kYourCustomScheme = @"xxxx";

@implementation SCURLManager

+ (BOOL)openURL:(NSURL *)url {
    return [self openURL:url options:nil];
}

+ (BOOL)openURL:(NSURL *)url options:(NSDictionary *)options {
    if ([url.scheme isEqualToString:kYourCustomScheme]) {
        SCURLHandlerBase *handler = [SCURLHandlerBase openURL:url options:options];
        return [handler handle];
    } else if ([url.scheme isEqualToString:@"http"] || [url.scheme isEqualToString:@"https"]) {
        [SCWebViewController openURL:url animated:YES];
        return YES;
    } else {
        return [[UIApplication sharedApplication] openURL:url];
    }
}

@end
