//
//  main.m
//  时间NSCalendar
//
//  Created by navchina on 2017/8/31.
//  Copyright © 2017年 laiyongpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
      
//        获取代表公历的calendar对象
        NSCalendar *calen = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//        获取当前时间
        NSDate *date = [NSDate date];
//        设置当前时间的格式
        unsigned unitFlags = NSCalendarUnitYear| NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitWeekday;
//        获取不同时间字段的信息
        NSDateComponents *comp = [calen components:unitFlags fromDate:date];
        NSLog(@"comp==%ld",(long)comp.weekday);
        
//        创建一个nsdatecomponents对象
        NSDateComponents *compD  = [[NSDateComponents alloc]init];
        compD.year = 2017;
        compD.month = 8;
        compD.day = 31;
        compD.weekday = 4;
        compD.hour = 10;
        compD.minute = 17;
        compD.second = 56;
        
        NSDate *date1 = [calen dateFromComponents:compD];
        NSDateFormatter *dateF = [[NSDateFormatter alloc]init];
        dateF.dateFormat = @"yyyy-MM-dd hh:mm:ss EEEE";
        NSString *dateS = [dateF stringFromDate:date1];
        NSLog(@"%@",dateS);
        
    }
    return 0;
}
