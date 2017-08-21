//
//  main.m
//  内部函数外部函数（三角形）
//
//  Created by navchina on 2017/8/21.
//  Copyright © 2017年 laiyongpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

//声明两个函数
void printRect(int height,int width);
void printTriganle(int height);
void printRightTriganle(int height);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        printRect(5, 7);
        printTriganle(7);
        printRightTriganle(7);
        
    }
    return 0;
}
