//
//  BNRItem.h
//  RandomItems
//
//  Created by legr on 26/10/15.
//  Copyright © 2015 legr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
{
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
}

+ (instancetype)randomItem;

// Designated initializer for BNRItem
- (instancetype) initWithItemName:(NSString *)name
           valueInDollars:(int)value
             serialNumber:(NSString *)sNumber;

- (instancetype) initWithItemName:(NSString *)name serialNumber:(NSString *)serial;
- (instancetype) initWithItemName:(NSString *)name;

- (void)setItemName:(NSString *) str;
- (NSString *) itemName;

- (void)setSerialNumber:(NSString *) str;
- (NSString *) serialNumber;

- (void) setValueInDollars:(int) v;
- (int) valueInDollars;

- (NSDate *) dateCreated;
@end
