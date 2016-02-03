//
//  SCWebViewController.h
//  SCURLManager
//
//  Created by sichenwang on 16/1/29.
//  Copyright © 2016年 sichenwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCWebViewController : UIViewController

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, copy, readonly) NSURL *url;

+ (void)openURL:(NSURL *)url;
+ (void)openURL:(NSURL *)url animated:(BOOL)animated;

@end
