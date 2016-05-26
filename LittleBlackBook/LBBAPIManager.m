//
//  LLBAPIManager.m
//  LittleBlackBook
//
//  Created by MyCityForKids on 25/05/16.
//  Copyright © 2016 Tasin Zarkoob. All rights reserved.
//

#import "LBBAPIManager.h"

@implementation LBBAPIManager

+ (LBBAPIManager *) sharedManager {
    static dispatch_once_t once;
    static LBBAPIManager *sharedInstance;
    
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] initWithBaseURL:[NSURL URLWithString:kInstagramBaseURLString]];
    });
    return sharedInstance;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    
    if (self) {
//        self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
//        self.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
//        self.requestSerializer = [AFJSONRequestSerializer serializer];
//        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    }
    
    return self;
}

- (void)hello:(completionSessionBlock)success failure:(failureSessionBlock)fail {
    
    NSString *accessToken = [[NSUserDefaults standardUserDefaults] objectForKey:kUserAccessTokenKey];
    NSString *urlString = [NSString stringWithFormat:@"%@?access_token=%@",kSearchTagEndpoint,accessToken];
    
    [self GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
