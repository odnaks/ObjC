#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *arr = @[@"one", @"two", @"three"];
        for (int i = 0; i < [arr count]; i++){
            NSLog(@"%@", arr[i]);
        }
    }
    return 0;
}
