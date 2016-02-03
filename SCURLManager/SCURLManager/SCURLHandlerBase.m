//
//  SCURLHandlerBase.m
//  SCURLManager
//
//  Created by sichenwang on 16/1/29.
//  Copyright © 2016年 sichenwang. All rights reserved.
//

#import "SCURLHandlerBase.h"
#import "SCURLOpenHandler.h"

@implementation SCURLHandlerBase

+ (instancetype)handleURL:(NSURL *)url {
    NSDictionary *handlerMap = @{
                                 @"open"  : [SCURLOpenHandler class]
                                 };
    NSString *type = url.host;
    Class class = handlerMap[type];
    if (class) {
        return [[class alloc] initWithURL:url];
    } else {
        return nil;
    }
}

- (instancetype)initWithURL:(NSURL *)url {
    if (self = [super init]) {
        NSString *jasonString = [[url.query stringByReplacingOccurrencesOfString:@"+" withString:@"%20"] stringByRemovingPercentEncoding];
        if (jasonString) {
            NSData *data = [jasonString dataUsingEncoding:NSUTF8StringEncoding];
            if (data) {
                id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                if ([json isKindOfClass:[NSDictionary class]]) {
                    _params = json;
                }
            }
        }
    }
    return self;
}

- (BOOL)handle {
    NSAssert(NO, @"You should implement this method in sub class");
    return NO;
}

@end
