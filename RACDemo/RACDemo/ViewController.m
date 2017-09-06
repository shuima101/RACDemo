//
//  ViewController.m
//  RACDemo
//
//  Created by FengGY on 2017/4/18.
//  Copyright © 2017年 HYB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UITextField *tf = [UITextField new];
    tf.frame = CGRectMake(100., 100., 200., 30.);
    tf.font = [UIFont systemFontOfSize:17.];
    tf.clearButtonMode = UITextFieldViewModeAlways;
    [self.view addSubview:tf];
    
    UILabel *lb = [UILabel new];
    lb.frame = CGRectMake(100., 150., 200., 30.);
    lb.font = [UIFont systemFontOfSize:17.];
    [self.view addSubview:lb];
    
//    [tf.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
//        NSLog(@"%@", x);
//    }];
    
    RACSignal *validSignal = [tf.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
        return value.length > 3;
    }];
    
    [validSignal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
    
//    RACSignal *lengthSignal = [tf.rac_textSignal map:^id _Nullable(NSString * _Nullable value) {
//        return @(value.length);
//    }];
    
    RAC(lb, text) = tf.rac_textSignal;
}


@end
