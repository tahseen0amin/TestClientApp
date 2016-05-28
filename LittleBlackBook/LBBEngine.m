//
//  LBBEngine.m
//  LittleBlackBook
//
//  Created by MyCityForKids on 26/05/16.
//  Copyright © 2016 Tasin Zarkoob. All rights reserved.
//

#import "LBBEngine.h"

@implementation LBBEngine

+(LBBEngine *)sharedEngine {
    static dispatch_once_t once;
    static LBBEngine *sharedInstance;
    
    dispatch_once(&once, ^{
        sharedInstance = [[LBBEngine alloc] init];
    });
    
    return sharedInstance;
    
}

// get media from flikr
- (void)getRecentPhotosFromFlikr {
    [[LBBAPIManager sharedManager] getFlikrPhotos:^(id responseObject) {
        // store photos
        NSArray *photos = responseObject[@"photos"][@"photo"];
        [self storePhotosInCoreData:photos];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

// store array into core data
- (void)storePhotosInCoreData:(NSArray *)photos {
    
    for (NSDictionary *dic in photos) {
        Media* media =[NSEntityDescription insertNewObjectForEntityForName:@"Media" inManagedObjectContext:[[CoreDataManager sharedManager] managedObjectContext]];
        media.mediaID = dic[@"id"];
        media.mediaURL = dic[@"url_m"];
        media.status = [NSNumber numberWithInt:MediaSelectedStateUNDECIDED];
    }
    
    [[CoreDataManager sharedManager] saveContext];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PhotoSaved" object:nil];
}

// fetch all media with state not changed for showing in home
- (NSArray *)fetchPhotosToShowInHome {
    NSArray *fetchedResults = nil;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Media"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"mediaID" ascending:YES]];
    request.predicate =nil;
    
    NSManagedObjectContext *managedObjectContext = [[CoreDataManager sharedManager] managedObjectContext];
    NSError *error;
    fetchedResults =  [managedObjectContext executeFetchRequest:request error:&error];
    
    return fetchedResults;
}

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

- (void)changedStatusOfMedia:(Media *)media image:(UIImage *)img ToStatus:(MediaSelectedState)status{
    media.status = [NSNumber numberWithInteger:status];
    if (img) {
        media.image = [NSData dataWithData:UIImagePNGRepresentation(img)];
    } else {
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
            //Background Thread
            UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:media.mediaURL]]];
            
            dispatch_async(dispatch_get_main_queue(), ^(void){
                //Run UI Updates
                if (img) {
                    media.image = [NSData dataWithData:UIImagePNGRepresentation(img)];
                    NSError *error;
                    [media.managedObjectContext save:&error];
                }
            });
        });
    }
    NSError *error;
    [media.managedObjectContext save:&error];
    
}

@end
