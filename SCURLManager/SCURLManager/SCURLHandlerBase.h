//
//  SCURLHandlerBase.h
//  SCURLManager
//
//  Created by sichenwang on 16/1/29.
//  Copyright © 2016年 sichenwang. All rights reserved.
//  

#import <UIKit/UIKit.h>

@interface SCURLHandlerBase : NSObject

/**
 *  query解码后的字典
 */
@property (nonatomic, copy, readonly) NSDictionary *params;

/**
 *  可选的额外字典
 */
@property (nonatomic, copy, readonly) NSDictionary *options;

+ (instancetype)openURL:(NSURL *)url;
+ (instancetype)openURL:(NSURL *)url options:(NSDictionary *)options;

- (BOOL)handle;

@end