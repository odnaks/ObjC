#import <Foundation/Foundation.h>

int is_alphabet(char c) {
    if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z'))
        return YES;
    return NO;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        char c = 'g';
        if (is_alphabet(c))
            printf("%c - YES\n", c);
        else
            printf("%c - NO\n", c);
        c = 'G';
        if (is_alphabet(c))
            printf("%c - YES\n", c);
        else
            printf("%c - NO\n", c);
        c = '%';
        if (is_alphabet(c))
            printf("%c - YES\n", c);
        else
            printf("%c - NO\n", c);
    }
    return 0;
}
