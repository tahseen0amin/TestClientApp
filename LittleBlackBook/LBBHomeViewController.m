//
//  LBBHomeViewController.m
//  LittleBlackBook
//
//  Created by MyCityForKids on 26/05/16.
//  Copyright © 2016 Tasin Zarkoob. All rights reserved.
//

#import "LBBHomeViewController.h"

@implementation LBBHomeViewController


- (void)viewDidLoad {
    [[LBBEngine sharedEngine] getRecentPhotosFromFlikr];
}

@end
