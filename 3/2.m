#import <Foundation/Foundation.h>

typedef enum Sign Sign;

enum Sign {
    plus,
    minus,
    dev,
    mul
};

int calculate(Sign sign, int a, int b) {
    
    switch (sign) {
        case plus:
            return a + b;
            break;
        case minus:
            return a - b;
        break;
        case dev:
            return a / b;
            break;
        case mul:
            return a * b;
            break;
        default:
            break;
    }
    
    return 0;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Sign sign_plus = plus;
        Sign sign_minus = minus;
        Sign sign_dev = dev;
        Sign sign_mul = mul;
        
        NSLog(@"%i", calculate(sign_plus, 3, 4));
        NSLog(@"%i", calculate(sign_minus, 3, 4));
        NSLog(@"%i", calculate(sign_dev, 3, 4));
        NSLog(@"%i", calculate(sign_mul, 3, 4));
    }
    return 0;
}

