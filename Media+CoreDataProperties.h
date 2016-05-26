//
//  Media+CoreDataProperties.h
//  LittleBlackBook
//
//  Created by MyCityForKids on 26/05/16.
//  Copyright © 2016 Tasin Zarkoob. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Media.h"

NS_ASSUME_NONNULL_BEGIN

@interface Media (CoreDataProperties)

@property (nullable, nonatomic, retain) NSData *image;
@property (nullable, nonatomic, retain) NSNumber *status;
@property (nullable, nonatomic, retain) NSNumber *mediaID;
@property (nullable, nonatomic, retain) NSString *mediaURL;

@end

NS_ASSUME_NONNULL_END
