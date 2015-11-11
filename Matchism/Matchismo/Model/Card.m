//
//  Card.m
//  Matchismo
//
//  Created by legr on 9/27/15.
//  Copyright © 2015 legr. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int) match: (NSArray *) outherCards
{
    int score = 0;
    
    for (Card *card in outherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    return score;
}

@end
