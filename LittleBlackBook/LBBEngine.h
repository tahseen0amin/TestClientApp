//
//  LBBEngine.h
//  LittleBlackBook
//
//  Created by MyCityForKids on 26/05/16.
//  Copyright © 2016 Tasin Zarkoob. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Media+CoreDataProperties.h"
#import "CoreDataManager.h"
#import "LBBAPIManager.h"

@interface LBBEngine : NSObject

+(LBBEngine *)sharedEngine;

- (void)getRecentPhotosFromFlikr;
- (NSArray *)fetchPhotosToShowInHome;
- (NSArray *)fetchLikedPhotosFromCoreData;
- (NSArray *)fetchDisLikedPhotosFromCoreData;
- (void)changedStatusOfMedia:(Media *)media image:(UIImage *)img ToStatus:(MediaSelectedState)status;
@end
