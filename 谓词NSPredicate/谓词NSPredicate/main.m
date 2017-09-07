//
//  main.m
//  谓词NSPredicate
//
//  Created by navchina on 2017/9/1.
//  Copyright © 2017年 laiyongpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
      
//        NSArray *numArr = [NSArray arrayWithObjects:@1,@2,@3,@12,@123, nil];
//        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF = 1"];//(1);
//        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF BETWEEN {10,200}"];//        (12,123);
       
//        NSArray *numArr = [NSArray arrayWithObjects:@"nihao",@"dabendan",@"Erhuo",@"nishishui",@"woshiizhutou",@"zenmele",@"laidajiaba", nil];
        //以什么开头
//        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH 'e'"];//(erhuo)
//        以什么结尾
//        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF ENDSWITH 'e'"];//(zenmele)
//        含有某个字符
//        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS 'e'"];//( dabendan,zenmele)
//        [cd],[c]不区分大小写，[d]不区分音符
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] 'e'"];//( dabendan,Erhuo,zenmele)
//        使用通配符
//        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF like 'ni*'"];//( nihao,nishishui)
        
//        NSArray *arr = [numArr filteredArrayUsingPredicate:predicate];
//        NSLog(@"%@",arr);
        
        /******集合运算符*****/
        NSArray *filterArray = @[@"ab",@"abc",@"a"];
        NSArray *array = @[@"a",@"mjy",@"pou",@"yui",@"abn"];
        NSPredicate *pre = [NSPredicate predicateWithFormat:@"not (SELF IN %@)",filterArray];//去重
        NSLog(@"%@",[array filteredArrayUsingPredicate:pre]);
        
        
        
    }
    return 0;
}
