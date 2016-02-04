//
//  SCURLTestHandler.m
//  SCURLManager
//
//  Created by sichenwang on 16/2/4.
//  Copyright © 2016年 sichenwang. All rights reserved.
//

#import "SCURLTestHandler.h"

@implementation SCURLTestHandler

- (BOOL)handle {
    NSLog(@"%@",self.params);
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 200, 50)];
    label.backgroundColor = [UIColor orangeColor];
    label.text = @"test scheme!";
    [[UIApplication sharedApplication].keyWindow addSubview:label];
    
    return YES;
}

@end
