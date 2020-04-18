#import <Foundation/Foundation.h>

typedef enum Gender Gender;
typedef struct Human Human;

enum Gender {
    female,
    male
};

struct Human {
    NSString    *name;
    NSInteger   age;
    Gender      gender;
};

typedef struct Position Position;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Human me;
        me.name = @"Ksenia";
        me.age = 20;
        me.gender = female;
    
        NSLog(@"\nname: %@\nage: %li\ngender: %@\n", me.name, me.age, me.gender ? @"male" : @"female");
    }
    return 0;
}

