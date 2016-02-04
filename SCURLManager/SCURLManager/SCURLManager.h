//
//  SCURLManager.h
//  SCURLManager
//
//  Created by sichenwang on 16/1/29.
//  Copyright © 2016年 sichenwang. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const kYourCustomScheme;

@interface SCURLManager : NSObject

+ (BOOL)openURL:(NSURL *)url;
+ (BOOL)openURL:(NSURL *)url options:(NSDictionary *)options;

@end
