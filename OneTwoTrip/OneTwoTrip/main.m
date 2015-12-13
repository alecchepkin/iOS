//
//  main.m
//  OneTwoTrip
//
//  Created by Oleg Chepkin on 11/12/15.
//  Copyright © 2015 Oleg Chepkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataModel.h"
#import "Symbol.h"



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        DataModel* dataModel = [[DataModel alloc] init];
        dataModel.inputFile = @"/Users/legr/Developer/iOS Testing/OneTwoTrip/OneTwoTrip/input.txt";
        dataModel.outputFile = @"/Users/legr/Developer/iOS Testing/OneTwoTrip/OneTwoTrip/output.txt";
        [dataModel setSymbolsFromInputFile];
        dataModel.string = [NSMutableString stringWithString:@"OneTwoTrip"];
        NSString* output = [dataModel makeOutput];
        NSLog(@"Output: %@", output);

    }
    return 0;
}
