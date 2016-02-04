//
//  SCURLTestHandler.m
//  SCURLManager
//
//  Created by sichenwang on 16/2/4.
//  Copyright © 2016年 sichenwang. All rights reserved.
//

#import "SCURLTestHandler.h"
#import "UIViewController+Extension.h"

@implementation SCURLTestHandler

- (BOOL)handle {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"test scheme" message:self.url.absoluteString preferredStyle:UIAlertControllerStyleAlert];
    [alert.topViewController presentViewController:alert animated:YES completion:nil];
    
    return YES;
}

@end
