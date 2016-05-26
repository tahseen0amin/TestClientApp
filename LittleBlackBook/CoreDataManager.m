//
//  CoreDataManager.m
//  LittleBlackBook
//
//  Created by MyCityForKids on 26/05/16.
//  Copyright © 2016 Tasin Zarkoob. All rights reserved.
//

#import "CoreDataManager.h"
#import "AppDelegate.h"

@implementation CoreDataManager

+ (CoreDataManager *) sharedManager {
    dispatch_once_t once;
    static CoreDataManager *sharedManager;
    
    dispatch_once(&once, ^{
        sharedManager = [[CoreDataManager alloc] init];
    });
    
    return sharedManager;
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)saveContext {
     id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(saveContext)]) {
        [delegate saveContext];
    }
}
@end
