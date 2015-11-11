//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by legr on 9/29/15.
//  Copyright © 2015 legr. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Card
@end

@implementation CardMatchingGame

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (NSMutableArray *)cards
{
    if(!_cards){
        _cards = [[NSMutableArray alloc]init];
    }
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck
{
    if(self=[super init]){
        for (int i=0; i<count; i++) {
            Card * card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card  = [self cardAtIndex:index];
    
//    if (!card) {
//        return;
//    }
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else{
            for (Card *outherCard in self.cards) {
                if (outherCard.isChosen && !outherCard.isMatched) {
                    int matchScore = [card match:@[outherCard]];
                    
                    if(matchScore){
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        outherCard.matched = YES;
                    }else{
                        self.score -= MISMATCH_PENALTY;
                        outherCard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
            
        }
        
    }
    
    
}


@end