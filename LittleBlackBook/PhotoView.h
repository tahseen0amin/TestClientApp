//
//  PhotoView.h
//  LittleBlackBook
//
//  Created by MyCityForKids on 29/05/16.
//  Copyright © 2016 Tasin Zarkoob. All rights reserved.
//

#import <BIZTinderCardStack/DraggableCardView.h>
#import "Media.h"

@interface PhotoView : DraggableCardView <UIGestureRecognizerDelegate>

@property(nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) Media *media;

@property(nonatomic, weak) IBOutlet UIButton *likedButton;
@property(nonatomic, weak) IBOutlet UIButton *dislikedButton;

@end
