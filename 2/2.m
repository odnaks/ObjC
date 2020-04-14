#import <Foundation/Foundation.h>

int sum(int a, int b) {
    return (a + b);
}

int sub(int a, int b) {
    return (a - b);
}

int multi(int a, int b) {
    return (a * b);
}

int divi(int a, int b) {
    return (a / b);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int a = 10;
        int b = 3;
        
        printf("a + b = %d\n", sum(a, b));
        printf("a - b = %d\n", sub(a, b));
        printf("a * b = %d\n", multi(a, b));
        printf("a / b = %d\n", divi(a, b));
    }
    return 0;
}
