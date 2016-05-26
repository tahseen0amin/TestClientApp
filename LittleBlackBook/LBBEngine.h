//
//  LBBEngine.h
//  LittleBlackBook
//
//  Created by MyCityForKids on 26/05/16.
//  Copyright © 2016 Tasin Zarkoob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Media+CoreDataProperties.h"

@interface LBBEngine : NSObject

+(LBBEngine *)sharedEngine;

- (NSArray *)fetchLikedPhotosFromCoreData;
- (NSArray *)fetchDisLikedPhotosFromCoreData;
- (void)changedStatusOfMedia:(Media *)media ToStatus:(MediaSelectedState)status;
@end
