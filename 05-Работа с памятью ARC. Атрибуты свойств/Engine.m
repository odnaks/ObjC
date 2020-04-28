#import <Foundation/Foundation.h>
#import "Engine.h"

@implementation Engine

- (instancetype)initWithModel:(NSString *)model {
    self = [super init];
    if (self) {
        [model retain];
        [model release];
        _model = model;
        NSLog(@"Model engine - %@", model);
    }
    return self;
}

- (void)dealloc {
    NSLog(@"Dealloc Enging - %@", _model);
    [_model release];
    [super dealloc];
}

@end

