//
//  DataModel.m
//  OneTwoTrip
//
//  Created by Oleg Chepkin on 11/12/15.
//  Copyright © 2015 Oleg Chepkin. All rights reserved.
//

#import "DataModel.h"
#import "Symbol.h"

@implementation DataModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.symbols = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSString *)description
{
    NSMutableString* desc;
    for (Symbol *symbol in self.symbols) {
        desc = [NSMutableString stringWithFormat:@"%@%@", desc, symbol];
    }
    return desc;
}
@end
