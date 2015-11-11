//
//  BNRContainer.h
//  RandomItems
//
//  Created by legr on 26/10/15.
//  Copyright © 2015 legr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
@interface BNRContainer : BNRItem
{
    NSMutableArray *_items;
}

- (void)addItem:(BNRItem *) item;
- (NSMutableArray *) items;
@end
