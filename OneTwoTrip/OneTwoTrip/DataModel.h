//
//  DataModel.h
//  OneTwoTrip
//
//  Created by Oleg Chepkin on 11/12/15.
//  Copyright © 2015 Oleg Chepkin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject
@property (nonatomic, strong) NSString* inputFile;
@property (nonatomic, strong) NSString* outputFile;
@property (nonatomic, strong) NSMutableArray* symbols;
@property (nonatomic, strong) NSMutableString* string;
@property (nonatomic, strong) NSMutableString* content;
@property (nonatomic) NSUInteger m;
@property (nonatomic) NSUInteger n;

- (void) setSymbolsFromInputFile;
- (NSString *) makeOutput;
@end
