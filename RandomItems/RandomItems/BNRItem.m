//
//  BNRItem.m
//  RandomItems
//
//  Created by legr on 26/10/15.
//  Copyright © 2015 legr. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

+ (instancetype) randomItem
{
    NSArray *adjectives = @[@"Fluffy", @"Rusty", @"Shiny"];
    NSArray *nouns = @[@"Bear", @"Spork", @"Mac"];
    
    int adjectiveIndex = arc4random() % 2;
    int nounIndex = arc4random() % 2;
    
    NSString * name = [NSString stringWithFormat:@"%@ %@",
                       adjectives[adjectiveIndex],
                       nouns[nounIndex]];
    
    int value = arc4random() % 100;
    
    NSString *serial = [NSString stringWithFormat:@"%c%c%c%c%c%c",
                        'A' + arc4random() % 26,
                        '0' + arc4random() % 10,
                        'A' + arc4random() % 26,
                        '0' + arc4random() % 10,
                        'A' + arc4random() % 26,
                        '0' + arc4random() % 10
                        ];
    
    id item = [[self alloc] initWithItemName:name
                                       valueInDollars:value
                                         serialNumber:serial];
    
    return item;
}

- (instancetype) initWithItemName:(NSString *)name
           valueInDollars:(int)value
             serialNumber:(NSString *)sNumber
{
    self = [super init];
    
    if (self) {
        _itemName = name;
        _valueInDollars = value;
        _serialNumber = sNumber;
        _dateCreated = [[NSDate alloc]init];
    }
    return self;
}

- (instancetype) initWithItemName:(NSString *)name serialNumber:(NSString *)serial
{
    return [self initWithItemName:name valueInDollars:0 serialNumber:serial];
}

- (instancetype) initWithItemName:(NSString *)name
{
    return [self initWithItemName:name
                   valueInDollars:0
                     serialNumber:@""];
}

- (void) setItemName:(NSString *)str
{
    _itemName = str;
}

- (NSString *) itemName
{
    return _itemName;
}


- (void) setSerialNumber:(NSString *)str
{
    _serialNumber = str;
}

- (NSString *) serialNumber
{
    return _serialNumber;
}


- (void) setValueInDollars:(int)v
{
    _valueInDollars = v;
}

- (int) valueInDollars
{
    return _valueInDollars;
}

- (NSDate *)  dateCreated
{
    return _dateCreated;
}

- (NSString *) description
{
    NSString * descriptionString = [[NSString alloc] initWithFormat:@"%@ [%@](%@): Worth %d, recorded on %@",
                                                    self.itemName,
                                                    [self class],
                                                    self.serialNumber,
                                                    self.valueInDollars,
                                                    self.dateCreated];
    return descriptionString;
}

@end
