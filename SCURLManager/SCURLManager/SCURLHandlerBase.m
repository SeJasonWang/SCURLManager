//
//  SCURLHandlerBase.m
//  SCURLManager
//
//  Created by sichenwang on 16/1/29.
//  Copyright © 2016年 sichenwang. All rights reserved.
//

#import "SCURLHandlerBase.h"
#import "SCURLTestHandler.h"

@implementation SCURLHandlerBase

+ (instancetype)openURL:(NSURL *)url {
    return [self openURL:url options:nil];
}

+ (instancetype)openURL:(NSURL *)url options:(NSDictionary *)options {
    static NSDictionary *handlerMap = nil;
    if (handlerMap == nil) {
        handlerMap = @{
                       @"test"  : [SCURLTestHandler class]
                     };
    }
    Class class = handlerMap[url.host];
    if (class) {
        return [[class alloc] initWithURL:url options:options];
    } else {
        return nil;
    }
}

- (instancetype)initWithURL:(NSURL *)url options:(NSDictionary *)options {
    if (self = [super init]) {
        _params  = [self params:url.query];
        _options = options;
        _url = url;
    }
    return self;
}

- (BOOL)handle {
    NSAssert(NO, @"You should implement this method in sub class");
    return NO;
}

#pragma mark Private Method

- (NSDictionary *)params:(NSString *)query {
    NSString *jsonString = [[query stringByReplacingOccurrencesOfString:@"+" withString:@"%20"] stringByRemovingPercentEncoding];
    if (jsonString) {
        NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        if (data) {
            id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            if ([json isKindOfClass:[NSDictionary class]]) {
                return json;
            }
        }
    }
    return nil;
}
@end
