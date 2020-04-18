//
//  main.m
//  lesson1
//
//  Created by 18450686 on 10.04.2020.
//  Copyright © 2020 18450686. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        int first;
        int second;
        
        printf("First number: ");
        scanf("%d", &first);
        printf("Second number: ");
        scanf("%d", &second);

        NSLog(@"\n%d + %d = %d\n%d - %d = %d\n%d * %d = %d\n%d / %d = %d\n%d %% %d = %d",
              first, second, first+second,
              first, second, first-second,
              first, second, first * second,
              first, second, first / second,
              first, second, first % second
        );
        
    }
    return 0;
}
