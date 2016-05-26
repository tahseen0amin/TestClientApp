//
//  LBBEngine.m
//  LittleBlackBook
//
//  Created by MyCityForKids on 26/05/16.
//  Copyright © 2016 Tasin Zarkoob. All rights reserved.
//

#import "LBBEngine.h"

#import "CoreDataManager.h"

@implementation LBBEngine

+(LBBEngine *)sharedEngine {
    static dispatch_once_t once;
    static LBBEngine *sharedInstance;
    
    dispatch_once(&once, ^{
        sharedInstance = [[LBBEngine alloc] init];
    });
    
    return sharedInstance;
    
}

// get media from instagram

// store array into core data

// fetch all media with state not changed for showing in home


// fetch liked media
- (NSArray *)fetchLikedPhotosFromCoreData {
    NSArray *fetchedResults = nil;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Media"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"mediaID" ascending:YES]];
    request.predicate = [NSPredicate predicateWithFormat:@"status==%d",MediaSelectedStateLIKED];
    
    NSManagedObjectContext *managedObjectContext = [[CoreDataManager sharedManager] managedObjectContext];
    NSError *error;
    fetchedResults =  [managedObjectContext executeFetchRequest:request error:&error];
    return fetchedResults;
}

// fetch disliked media
- (NSArray *)fetchDisLikedPhotosFromCoreData {
    NSArray *fetchedResults = nil;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Media"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"mediaID" ascending:YES]];
    request.predicate = [NSPredicate predicateWithFormat:@"status==%d",MediaSelectedStateDISLIKED];
    
    NSManagedObjectContext *managedObjectContext = [[CoreDataManager sharedManager] managedObjectContext];
    NSError *error;
    fetchedResults =  [managedObjectContext executeFetchRequest:request error:&error];
    return fetchedResults;
}

// change state of media

- (void)changedStatusOfMedia:(Media *)media ToStatus:(MediaSelectedState)status {
    media.status = [NSNumber numberWithInteger:status];
    
    NSError *error;
    [media.managedObjectContext save:&error];
    
}

@end
