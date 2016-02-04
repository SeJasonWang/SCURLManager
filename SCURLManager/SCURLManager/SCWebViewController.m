//
//  SCWebViewController.m
//  SCURLManager
//
//  Created by sichenwang on 16/1/29.
//  Copyright © 2016年 sichenwang. All rights reserved.
//

#import "SCWebViewController.h"
#import "SCURLManager.h"
#import "UIViewController+Extension.h"

@implementation NSString(Extension)

- (BOOL)isValidString {
    if (self == nil ||
        self == NULL ||
        [self isKindOfClass:[NSNull class]] ||
        [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0) {
        return NO;
    } else {
        return YES;
    }
}

@end

@interface SCWebViewController()<UIWebViewDelegate>

@end

@implementation SCWebViewController

#pragma mark - Life Cycle

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self createWebView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self createWebView];
    }
    return self;
}

#pragma mark - Public Method

+ (void)openURL:(NSURL *)url animated:(BOOL)animated {
    [self openURL:url animated:animated options:nil];
}

+ (void)openURL:(NSURL *)url animated:(BOOL)animated options:(NSDictionary *)options {
    SCWebViewController *webC = [[SCWebViewController alloc] init];
    [webC.webView loadRequest:[NSURLRequest requestWithURL:url]];
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:webC];
    [webC.topViewController presentViewController:navC animated:YES completion:nil];
}

#pragma mark - Private Method

- (void)createWebView {
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    webView.delegate = self;
    webView.scrollView.directionalLockEnabled = YES;
    webView.mediaPlaybackRequiresUserAction = NO;
    [self.view addSubview:webView];
    _webView = webView;
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    if (title.isValidString) {
        self.title = title;
    }

}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if (![request.URL.scheme isEqualToString:@"http"] && ![request.URL.scheme isEqualToString:@"https"]) {
        return ![SCURLManager openURL:request.URL];
    }
    return YES;
}


@end
