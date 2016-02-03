//
//  SCURLHandlerBase.h
//  SCURLManager
//
//  Created by sichenwang on 16/1/29.
//  Copyright © 2016年 sichenwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCURLHandlerBase : NSObject

@property (nonatomic, copy, readonly) NSDictionary *params;

+ (instancetype)handleURL:(NSURL *)url;

- (BOOL)handle;

@end
