//
//  PrintFunction.m
//  内部函数外部函数（三角形）
//
//  Created by navchina on 2017/8/21.
//  Copyright © 2017年 laiyongpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

//声明一个外部函数
extern void printRect(int height,int width){

    for (int i = 0; i<height; i++) {
    
        for (int j = 0; j<width; j++) {
             printf("*");
        }
        printf("\n");
    }
}

extern void printTriganle(int height){

    for (int i = 0; i<height; i++) {
        
//        打印空格
        for (int j = 0; j < height - 1 -i; j++) {
            
            printf(" ");
        }
//        打印*
        for (int m = 0; m < 2*i + 1; m++) {
            printf("*");
        }
        printf("\n");
    }
}

extern void printRightTriganle(int height){

    for (int i = 0; i<height; i++) {
        
        //        打印*
        for (int m = 0; m < i + 1; m++) {
            printf("*");
        }
        //        打印空格
        for (int j = 0; j < height - 1 -i; j++) {
            
            printf(" ");
        }
        printf("\n");
    }

}
