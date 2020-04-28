#import <Foundation/Foundation.h>
#import "Wheel.h"
#import "Engine.h"

@interface Car : NSObject

- (void)configWithEngine:(Engine *)engine andWheels:(NSArray *)wheels;

@property (nonatomic, strong) Engine *engine;
@property (nonatomic, strong) NSArray *wheels;

@end

