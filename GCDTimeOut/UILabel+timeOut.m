//
//  UILabel+timeOut.m
//  Test
//
//  Created by 钟亮 on 2017/3/17.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import "UILabel+timeOut.h"

@implementation UILabel (timeOut)

- (void)timeOutWithSecond:(int)second{
    
    __block int timeout = second*100; //倒计时时间 换算为10毫秒一单位
    
    [self conversionWithTimeOut:timeout];
    
    
    __block dispatch_source_t timer;
    
    if (timer==nil) {
        
        if (timeout!=0) {
            
            //并发队列
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            
            //创建定时器
            timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
            
            //每10毫秒秒执行
            dispatch_source_set_timer(timer,dispatch_walltime(NULL, 0),10*NSEC_PER_MSEC, 0);
            
            dispatch_source_set_event_handler(timer, ^{
                if(timeout<=0){
                    //倒计时结束，关闭
                    dispatch_source_cancel(timer);
                    timer = nil;
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        self.text = @"00:00:00:00";
                        
                    });
                }else{
                    
                    [self conversionWithTimeOut:timeout];
                    
                    timeout--;
                }
            });
            
            //启动定时器
            dispatch_resume(timer);
        }
    }

}

//时间换算
- (void)conversionWithTimeOut:(int)timeout{
    
    int hours = (int)timeout/100/3600;
    int minute = (int)(timeout/100-hours*3600)/60;
    int second = (int)timeout/100-hours*3600-minute*60;
    int secondT = timeout-hours*3600*100-minute*60*100-second*100;
    
    NSString *hourString;
    NSString *minuteString;
    NSString *secondString;
    NSString *secondTString;
    
    
    if (hours<10) {
        hourString = [NSString stringWithFormat:@"0%d",hours];
    }else{
        hourString = [NSString stringWithFormat:@"%d",hours];
    }
    if (minute<10) {
        minuteString = [NSString stringWithFormat:@"0%d",minute];
    }else{
        minuteString = [NSString stringWithFormat:@"%d",minute];
    }
    if (second<10) {
        secondString = [NSString stringWithFormat:@"0%d",second];
    }else{
        secondString = [NSString stringWithFormat:@"%d",second];
    }
    
    if (secondT<10) {
        secondTString = [NSString stringWithFormat:@"0%d",secondT];
    }else{
        secondTString = [NSString stringWithFormat:@"%d",secondT];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        self.text = [NSString stringWithFormat:@"%@:%@:%@:%@",hourString,minuteString,secondString,secondTString];
        
    });
}
@end
