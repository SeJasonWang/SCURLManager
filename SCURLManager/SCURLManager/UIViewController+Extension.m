//
//  UIViewController+Extension.m
//  SCURLManager
//
//  Created by sichenwang on 16/2/4.
//  Copyright © 2016年 sichenwang. All rights reserved.
//

#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)

- (UIViewController *)topViewController {
    UIViewController *topViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (YES) {
        if ([topViewController presentedViewController] == nil) {
            break;
        }
        topViewController = [topViewController presentedViewController];
    }
    return topViewController;
}

@end
