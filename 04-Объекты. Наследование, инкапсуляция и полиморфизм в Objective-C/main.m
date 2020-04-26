//
//  main.m
//  l4
//
//  Created by Ksenia on 26.04.2020.
//  Copyright © 2020 Ksenia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student *student = [[Student alloc] initWithName: @"Ksenia" andSurname: @"Lukoshkina"];
        NSLog(@"%@", student);
        [student incrementAge];
        NSLog(@"%@", student);
    }
    return 0;
}
