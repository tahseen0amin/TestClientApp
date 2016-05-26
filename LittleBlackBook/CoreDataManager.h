//
//  CoreDataManager.h
//  LittleBlackBook
//
//  Created by MyCityForKids on 26/05/16.
//  Copyright © 2016 Tasin Zarkoob. All rights reserved.
//

#import <Foundation/Foundation.h>

@import CoreData;

@interface CoreDataManager : NSObject

+(CoreDataManager *) sharedManager;

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

- (void)saveContext;

@end
