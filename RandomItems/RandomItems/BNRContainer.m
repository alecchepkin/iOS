//
//  BNRContainer.m
//  RandomItems
//
//  Created by legr on 26/10/15.
//  Copyright © 2015 legr. All rights reserved.
//

#import "BNRContainer.h"

@implementation BNRContainer

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _items = [[NSMutableArray alloc] init];
    }
    
    return self;
}
- (NSString *) description
{
    NSMutableString *desc = [[NSMutableString alloc] init];
    [desc appendString:[super description]];
    [desc appendString:@"\rItems: {\r"];
    int i = 0;
    for (BNRItem *item in _items) {
        [desc appendString:[NSString stringWithFormat:@" %d-%@,\r", i++,[item description]]];
    }
    [desc appendString:@"}"];
    return desc;
}


- (void) addItem:(BNRItem *)item
{
    [_items addObject:item];
}

- (NSMutableArray *) items
{
    return _items;
}

@end
