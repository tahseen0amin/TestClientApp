//
//  LLBAPIManager.h
//  LittleBlackBook
//
//  Created by MyCityForKids on 25/05/16.
//  Copyright © 2016 Tasin Zarkoob. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AFNetworking/AFNetworking.h>

typedef void (^completionSessionBlock)(id responseObject);
typedef void (^failureSessionBlock)(NSURLSessionDataTask *task, NSError *error);

@interface LBBAPIManager : AFHTTPSessionManager

+ (LBBAPIManager *) sharedManager;

- (void)getFlikrPhotos:(completionSessionBlock)success failure:(failureSessionBlock)fail;
@end
