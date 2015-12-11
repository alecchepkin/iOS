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
        // The source text file is named "Example.txt". Written with UTF-8 encoding.
        NSString *path = @"/Volumes/Distrib/Developer/iOS/iOS Testing/OneTwoTrip/OneTwoTrip/file.txt";
        
        NSLog(@"path%@", path);
        NSError* error = nil;
        NSString* content = [NSString stringWithContentsOfFile:path
                                                      encoding:NSUTF8StringEncoding
                                                         error:&error];
        NSLog(@"content%@", content);
        if(error) { // If error object was instantiated, handle it.
            NSLog(@"ERROR while loading from file: %@", error);
            // …
        }//        struct Position position;
//        position.i = 1;
//        position.j = 2;
//        Symbol* symbol = [[Symbol alloc] initWithName:@"h" andPosition:position];
//        [dataModel.symbols addObject:symbol];
//
        
        
        NSLog(@"dataModel%@", dataModel);
    }
    return 0;
}
