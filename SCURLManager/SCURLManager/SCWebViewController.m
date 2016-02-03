//
//  SCWebViewController.m
//  SCURLManager
//
//  Created by sichenwang on 16/1/29.
//  Copyright © 2016年 sichenwang. All rights reserved.
//

#import "SCWebViewController.h"
#import "SCURLManager.h"

@interface NSString(Extension)

- (BOOL)isEmptyString;

@end

@implementation NSString(Extension)

- (BOOL)isEmptyString {
    if (self == nil) {
        return YES;
    }
    if (self == NULL) {
        return YES;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0) {
        return YES;
    }
    return NO;
}

@end

@interface SCWebViewController()<UIWebViewDelegate>

@end

@implementation SCWebViewController

#pragma mark - Life Cycle

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setUp];
    }
    return self;
}

#pragma mark - Public Method

+ (void)openURL:(NSURL *)url {
    [self openURL:url animated:YES];
}

+ (void)openURL:(NSURL *)url animated:(BOOL)animated {
    SCWebViewController *webVc = [[SCWebViewController alloc] init];    
    [webVc.webView loadRequest:[NSURLRequest requestWithURL:url]];
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:webVc];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:navC animated:YES completion:nil];
}

#pragma mark - Private Method

- (void)setUp {
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.webView.delegate = self;
    self.webView.scrollView.directionalLockEnabled = YES;
    self.webView.mediaPlaybackRequiresUserAction = NO;
    [self.view addSubview:self.webView];
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    if (!title.isEmptyString) {
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
