//
//  Deck.h
//  Matchismo
//
//  Created by legr on 9/27/15.
//  Copyright © 2015 legr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface Deck : NSObject

- (void) addCard:(Card *)card atTop:(BOOL)atTop;
- (void) addCard:(Card *)card;

- (Card *) drawRandomCard;

@end
