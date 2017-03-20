//
//  TableViewController.m
//  GCDTimeOut
//
//  Created by 钟亮 on 2017/3/17.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import "TableViewController.h"
#import "UILabel+timeOut.h"
@interface TableViewController ()
{
    NSMutableArray *timeArr;
}
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    timeArr = [[NSMutableArray alloc]init];
    
    for (int i = 0; i<10; i++) {
        
        int time = arc4random()%100;
        
        [timeArr addObject:[NSNumber numberWithInt:time]];
    }
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return timeArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    [cell.textLabel timeOutWithSecond:[timeArr[indexPath.row] intValue]];
    
    return cell;
}


@end
