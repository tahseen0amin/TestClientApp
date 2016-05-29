//
//  PhotoView.m
//  LittleBlackBook
//
//  Created by MyCityForKids on 29/05/16.
//  Copyright © 2016 Tasin Zarkoob. All rights reserved.
//

#import "PhotoView.h"
#import <Haneke/Haneke.h>

@implementation PhotoView

- (void)setup
{
    [super setup];
    
    UITapGestureRecognizer *tapApproveImageViewGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(rightButtonAction)];
    // * Pass the touch to the next responder
    tapApproveImageViewGesture.cancelsTouchesInView = NO;
    [self.likedButton addGestureRecognizer:tapApproveImageViewGesture];
    
    UITapGestureRecognizer *tapRejectImageViewGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(leftButtonAction)];
    tapRejectImageViewGesture.cancelsTouchesInView = NO;
    [self.dislikedButton addGestureRecognizer:tapRejectImageViewGesture];
}

- (void)setMedia:(Media *)media {
    _media = media;
    [_imageView hnk_setImageFromURL:[NSURL URLWithString:media.mediaURL] placeholder:nil];
}
@end
