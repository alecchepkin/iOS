//
//  Symbol.h
//  OneTwoTrip
//
//  Created by Oleg Chepkin on 11/12/15.
//  Copyright © 2015 Oleg Chepkin. All rights reserved.
//

#import <Foundation/Foundation.h>

struct Position {
    int i;
    int j;
};

@interface Symbol : NSObject
@property (nonatomic, strong) NSString* name;
@property (nonatomic) BOOL isUsed;
@property (nonatomic) struct Position position;

- (instancetype)initWithName:(NSString*)name andPosition:(struct Position)position;

@end
