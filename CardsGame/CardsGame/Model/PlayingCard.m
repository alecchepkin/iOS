//
//  PlayingCard.m
//  Matchismo
//
//  Created by legr on 9/27/15.
//  Copyright © 2015 legr. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)outherCards
{
    int score = 0;
    if([outherCards count] == 1){
        PlayingCard *outherCard = [outherCards firstObject];
        if (self.rank == outherCard.rank) {
            score = 4;
        } else if([self.suit isEqualToString:outherCard.suit]){
            score = 1;
        }
    }

    
    return score;
    
}

- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+ (NSArray *) rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSArray *)validSuits
{
    return @[@"♥︎",@"♣︎",@"♠︎",@"♦︎"];
}

@synthesize suit = _suit;

- (void)setSuit:(NSString *)suit
{
    if ([ [PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *) suit
{
    return _suit ? _suit : @"?";
}

+ (NSUInteger)maxRank
{
    return [[self rankStrings] count]-1;
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}
@end
