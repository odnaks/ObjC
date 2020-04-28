#import <Foundation/Foundation.h>

@interface Wheel : NSObject

- (instancetype) initWithNumber:(NSNumber *)number;
@property (nonatomic, strong) NSNumber *number;
@end
