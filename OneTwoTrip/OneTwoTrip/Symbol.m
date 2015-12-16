//
//  Symbol.m
//  OneTwoTrip
//
//  Created by Oleg Chepkin on 11/12/15.
//  Copyright © 2015 Oleg Chepkin. All rights reserved.
//

#import "Symbol.h"
#import <ctype.h>

@implementation Symbol

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isUsed = NO;
    }
    return self;
}

- (instancetype)initWithName:(char) name
                 andPosition:(struct Position)position
{
    self = [self init];
    if (self) {
        self.name = name;
        self.position = position;
    }
    return self;
}


- (NSString *)description
{

    return [NSString stringWithFormat:@"%c - (%d,%d)\n", _name, _position.i, _position.j];
}

- (BOOL)suitWithCharAndNotUsed:(char)ch {

    
    if (self.isUsed == NO) {
        char lowerChar = tolower(ch);
        char lowerName = tolower(self.name);
        
        return (lowerChar == lowerName);
    }
    return NO;
}

- (void) markAsUsed{
    self.isUsed = YES;
}
@end
