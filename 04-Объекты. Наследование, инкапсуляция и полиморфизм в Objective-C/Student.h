//
//  Student.h
//  l4
//
//  Created by Ksenia on 26.04.2020.
//  Copyright © 2020 Ksenia. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property(readonly) NSString *name;
@property(readonly) NSString *surname;
@property(readonly) NSString *fullName;
@property(readonly) NSNumber *age;
 
- (instancetype)initWithName:(NSString*)name andSurname: (NSString*)surname;
- (void)incrementAge;

@end

NS_ASSUME_NONNULL_END
