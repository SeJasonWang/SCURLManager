//
//  ViewController.m
//  SCURLManager
//
//  Created by sichenwang on 16/1/29.
//  Copyright © 2016年 sichenwang. All rights reserved.
//

#import "ViewController.h"
#import "SCURLManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *str1 = @"xxxx://test?%7B%22nid%22%3A%222665%22%2C%22word_name%22%3A%22%5Cu5185%5Cu8863%22%2C%22api%22%3A%7B%22path%22%3A%22search%5C%2Ftag_poster%22%2C%22query%22%3A%7B%22tag_word%22%3A%22%5Cu5185%5Cu8863%22%2C%22_page_area%22%3A%22%5Cu4e8c%5Cu7ea7%5Cu7c7b%5Cu76ee%22%7D%7D%2C%22r%22%3A%22navigation-left%3A_page_code%3DMLSCategoryViewController%3Apos%3D7%3Aname%3D%25E5%2586%2585%25E8%25A1%25A3%3A_page_area%3D%25E7%2583%25AD%25E9%2597%25A8%25E5%2588%2586%25E7%25B1%25BB%3A_pos_id%3D7%3A_pos_name%3D%25E5%2586%2585%25E8%25A1%25A3%22%7D";
    NSString *str2 = @"http://www.baidu.com";
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SCURLManager openURL:[NSURL URLWithString:str1]];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SCURLManager openURL:[NSURL URLWithString:str2]];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
