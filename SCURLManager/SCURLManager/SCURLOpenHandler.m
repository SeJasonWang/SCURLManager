//
//  SCURLOpenHandler.m
//  SCURLManager
//
//  Created by sichenwang on 16/2/3.
//  Copyright © 2016年 sichenwang. All rights reserved.
//

#import "SCURLOpenHandler.h"

@implementation SCURLOpenHandler

- (BOOL)handle {
    NSLog(@"%@",self.params);
    return YES;
}

@end
