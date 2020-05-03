//
//  main.m
//  lesson6
//
//  Created by Ksenia on 03.05.2020.
//  Copyright © 2020 Ksenia. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^printBlockNull)(void);
typedef void(^printBlockOne)(int);
typedef void(^printBlockTwo)(int, int);
typedef void(^printBlockThree)(int, int, int);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        printBlockNull printNull = ^(void){
            NSLog(@"NULL");
        };
        printBlockOne miniPrintOne = ^(int value){
            NSLog(@"%i", value);
        };
        printBlockOne mediumPrintOne = ^(int value){
            NSLog(@"value =  [ %i ]", value);
        };
        printBlockTwo miniPrintTwo = ^(int value1, int value2){
            NSLog(@"%i, %i", value1, value2);
        };
        printBlockTwo mediumPrintTwo = ^(int value1, int value2){
            NSLog(@"values = [ %i ], [ %i ]", value1, value2);
        };
        printBlockThree miniPrintThree = ^(int value1, int value2, int value3){
            NSLog(@"%i, %i, %i", value1, value2, value3);
        };
        printBlockThree mediumPrintThree = ^(int value1, int value2, int value3){
            NSLog(@"values = [ %i ], [ %i ], [ %i ]", value1, value2, value3);
        };
        printNull();
        miniPrintOne(1);
        mediumPrintOne(2);
        miniPrintTwo(3, 3);
        mediumPrintTwo(4, 4);
        miniPrintThree(5, 5, 5);
        mediumPrintThree(6, 6, 6);
        NSLog(@"=============================");
        
        printBlockNull printNull1 = ^(void){
            NSLog(@"NULL1");
            sleep(1);
        };
        printBlockNull printNull2 = ^(void){
            NSLog(@"NULL2");
            sleep(1);
        };
        printBlockNull printNull3 = ^(void){
            NSLog(@"NULL3");
            sleep(1);
        };
        
        dispatch_queue_t queue = dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0);
        dispatch_async(queue, ^{
            printNull1();
            dispatch_sync(queue, printNull2);
        });
        dispatch_async(queue, printNull3);
        
        sleep(2);
    }
    return 0;
}
