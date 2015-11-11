//
//  PlayingDeck.m
//  Matchismo
//
//  Created by legr on 9/27/15.
//  Copyright © 2015 legr. All rights reserved.
//

#import "PlayingDeck.h"
#import "PlayingCard.h"
@implementation PlayingDeck

- (instancetype)init
{
    
    if (self = [super init]) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank=1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc]init];
                card.suit = suit;
                card.rank = rank;
                [self addCard:card];
                
            }
        }
    }
    
    return self;
}

@end
