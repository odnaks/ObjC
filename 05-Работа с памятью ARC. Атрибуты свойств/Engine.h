#import <Foundation/Foundation.h>

@interface Engine : NSObject

- (instancetype) initWithModel:(NSString *)model;

@property (nonatomic, strong) NSString *model;

@end

