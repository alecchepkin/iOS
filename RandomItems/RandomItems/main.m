//
//  main.m
//  RandomItems
//
//  Created by legr on 26/10/15.
//  Copyright © 2015 legr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContainer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //NSLog(@"Hello, World!");
        
        //NSMutableArray *items = [[NSMutableArray alloc]init];
        
        //[items addObject:@"One"];
        //[items addObject:@"Two"];
        //[items addObject:@"Three"];
        //[items insertObject:@"Zero" atIndex:0];
        
//        for (int i=0; i<10; i++) {
//            BNRItem *item = [BNRItem randomItem];
//            [items addObject:item];
//        }
        //bnr
        
        //id lastObj = [items lastObject];
        
        //[lastObj count];

//        BNRItem *lastItem = items[9];
//        for(NSString *item in items){
//            NSLog(@"%@", item);
//        }
        
        //BNRItem *item = [[BNRItem alloc] init];
        //BNRItem *item = [[BNRItem alloc] initWithItemName:@"Red Sofa" valueInDollars:100 serialNumber:@"A23432"];
        
        //item.itemName = @"Red Sofa";
        //item.serialNumber = @"A345432";
        //item.valueInDollars = 100;
        
        //NSLog(@"%@ %@ %@ %d", [item itemName], [item serialNumber], [item dateCreated], [item valueInDollars]);
        //NSLog(@"%@", item);
        
        //BNRItem *itemWithName = [[BNRItem alloc] initWithItemName:@"Blue Sofa"];
        //NSLog(@"%@", itemWithName);
        
        //BNRItem *itemWithNoName = [[BNRItem alloc] init];
        //NSLog(@"%@", itemWithNoName);
        
        //BNRItem *itemWithNameAndSerial = [[BNRItem alloc]initWithItemName:@"White Sofa" serialNumber:@"G345GEW"];
        //NSLog(@"%@", itemWithNameAndSerial);
        
        
        BNRContainer *container = [[BNRContainer alloc] init];
        
        [container addItem:[[BNRItem alloc] initWithItemName:@"11111"]];
        [container addItem:[[BNRItem alloc] initWithItemName:@"222222"]];
        BNRContainer *newContainer = [[BNRContainer alloc] init];
        newContainer.itemName = @"New container";
        [newContainer addItem:[[BNRItem alloc] initWithItemName:@"iii"]];
        [container addItem:newContainer];

        NSLog(@"%@", container);
        
        container = nil;
    }
    return 0;
}
