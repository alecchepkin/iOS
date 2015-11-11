//
//  PlayingCard.h
//  Matchismo
//
//  Created by legr on 9/27/15.
//  Copyright © 2015 legr. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSString *suit;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
