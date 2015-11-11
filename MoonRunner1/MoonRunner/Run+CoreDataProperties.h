//
//  Run+CoreDataProperties.h
//  MoonRunner
//
//  Created by legr on 05/11/15.
//  Copyright © 2015 legr. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Run.h"

NS_ASSUME_NONNULL_BEGIN

@interface Run (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *distance;
@property (nullable, nonatomic, retain) NSNumber *duration;
@property (nullable, nonatomic, retain) NSDate *timestamp;
@property (nullable, nonatomic, retain) NSSet<Location *> *locations;

@end

@interface Run (CoreDataGeneratedAccessors)

- (void)addLocationsObject:(Location *)value;
- (void)removeLocationsObject:(Location *)value;
- (void)addLocations:(NSSet<Location *> *)values;
- (void)removeLocations:(NSSet<Location *> *)values;

@end

NS_ASSUME_NONNULL_END
