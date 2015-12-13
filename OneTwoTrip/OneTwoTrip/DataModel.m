//
//  DataModel.m
//  OneTwoTrip
//
//  Created by Oleg Chepkin on 11/12/15.
//  Copyright © 2015 Oleg Chepkin. All rights reserved.
//

#import "DataModel.h"
#import "Symbol.h"
#import <ctype.h>

@implementation DataModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.symbols = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSString *)description
{
    NSMutableString* desc;
    for (Symbol *symbol in self.symbols) {
        desc = [NSMutableString stringWithFormat:@"%@%@", desc, symbol];
    }
    return desc;
}

- (void) setSymbolsFromInputFile{
    //NSString *path = @"/Users/legr/Developer/iOS Testing/OneTwoTrip/OneTwoTrip/input.txt";
    NSError* error = nil;
    self.content = [NSMutableString stringWithContentsOfFile:self.inputFile
                                                  encoding:NSUTF8StringEncoding
                                                     error:&error];
    //NSLog(@"content: %@", self.content);
    
    if(error) { // If error object was instantiated, handle it.
        NSLog(@"ERROR while loading from file: %@", error);
    }
    
   [self parseContent];
    
    
}

- (void) parseContent {
    
    NSArray* rows = [self.content componentsSeparatedByString:@"\n"];
    NSArray* dimensions = [rows[0] componentsSeparatedByString:@" "];
    self.m = [dimensions[0] intValue];
    self.n = [dimensions[1] intValue];
    
    for(int i = 0; i < self.m; i++){
        for(int j = 0; j < self.n; j++){
            char ch = [rows[i+1] characterAtIndex:j];
            struct Position pos;
            pos.i = i;
            pos.j = j;
            Symbol* symbol = [[Symbol alloc] initWithName:ch andPosition:pos];
            [self.symbols addObject:symbol];
        }
    }
}



- (NSString *)makeOutput{
    NSMutableString * output = [NSMutableString string];
    
    NSUInteger stringLength = [self.string length];
    
    for (int position=0; position < stringLength; position++) {
        
        char ch = [_string characterAtIndex:position];
        //char lowerChar = tolower(ch);
        Symbol* symbol = [self findSymbol:ch];
        if (symbol) {
            [output appendString:[symbol description]];
        } else{
            [output appendString:@"Impossible\n"];
        }

    }
    
    [output writeToFile:self.outputFile atomically:NO encoding:NSStringEncodingConversionAllowLossy error:nil];
    return output;
}

- (Symbol*) findSymbol: (char) ch{
    for (Symbol* symbol in self.symbols) {
        if ([symbol suitWithCharAndNotUsed: ch]) {
            [symbol markAsUsed];
            return symbol;
        }
    }
    return nil;
}
@end
