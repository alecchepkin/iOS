//
//  Card.h
//  Matchismo
//
//  Created by legr on 9/27/15.
//  Copyright © 2015 legr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int) match: (NSArray *) outherCards;

@end
