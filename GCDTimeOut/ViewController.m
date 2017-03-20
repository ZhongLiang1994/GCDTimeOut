//
//  ViewController.m
//  GCDTimeOut
//
//  Created by 钟亮 on 2017/3/17.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+timeOut.h"
#import "TableViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)startTimeOut:(id)sender {
    
    [self.timeLabel timeOutWithSecond:60];
    
    UIButton *btn = (UIButton *)sender;
    
    btn.userInteractionEnabled = NO;
    
    [btn setTitle:@"倒计时" forState:UIControlStateNormal];
    
}
- (IBAction)toTableViewTimeOut:(id)sender {
    [self.navigationController pushViewController:[[TableViewController alloc]init] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
