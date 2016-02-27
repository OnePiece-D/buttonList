//
//  ViewController.m
//  buttonList
//
//  Created by ycd9 on 16/2/14.
//  Copyright © 2016年 ycd9. All rights reserved.
//

#import "ViewController.h"

#import "ButtonListView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    ButtonListView * listView = [[ButtonListView alloc] initWithFrame:CGRectMake(0, 200, 300, 50)];
    
    listView.btnTitleArray = @[@"出发装货",@"申请撤单",@"更多"];
    //字体大小，字体颜色，字体下划线否，背景色，边框，边框颜色
    listView.normalStyle = @[@"15",[UIColor whiteColor],@"0",[UIColor orangeColor],@1,[UIColor orangeColor]];
    listView.normalStyle = @[@"15",[UIColor orangeColor],@"0",[UIColor whiteColor],@1,[UIColor orangeColor]];
    listView.normalStyle = @[@"15",[UIColor blackColor],@"1"];
    
    listView.btnSize = CGSizeMake(80, 40);
    listView.btnSize = CGSizeMake(80, 40);
    
//    listView.backgroundColor = [UIColor blueColor];
    listView.buttonListTouchActionBlock = ^(NSInteger index) {
        NSLog(@"%ld",index);
    };
    
    [self.view addSubview:listView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
