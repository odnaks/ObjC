//
//  Student.m
//  l4
//
//  Created by Ksenia on 26.04.2020.
//  Copyright © 2020 Ksene4ka. All rights reserved.
//

#import "Student.h"

@implementation Student

@synthesize name;
@synthesize surname;
@synthesize fullName;
@synthesize age;

- (instancetype)initWithName:(NSString*)name andSurname: (NSString*)surname
{
    self = [super init];
    if (self) {
        self->name = name;
        self->surname = surname;
        self->age = @1;
        self->fullName = self.concateNameAndSurname;
    }
    return(self);
}

- (NSString *)concateNameAndSurname
{
    NSString *spSurname = [@" " stringByAppendingString: self->surname];
    NSString *str = [self->name stringByAppendingString: spSurname];
    return(str);
}

- (NSString*)description {
    NSString *str = [self->fullName stringByAppendingString: @", "];
    NSString *ageString = [self->age stringValue];
    str = [str stringByAppendingString: ageString];
    str = [str stringByAppendingString: @" y.o."];
    return(str);
}

- (void)incrementAge {
    self->age = @([self->age intValue] + 1);
}

@end
