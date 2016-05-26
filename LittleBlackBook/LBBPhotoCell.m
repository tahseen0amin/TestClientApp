//
//  LBBPhotoCell.m
//  LittleBlackBook
//
//  Created by MyCityForKids on 26/05/16.
//  Copyright © 2016 Tasin Zarkoob. All rights reserved.
//

#import "LBBPhotoCell.h"

@implementation LBBPhotoCell

-(void)awakeFromNib {
    self.lbb_cardView.layer.cornerRadius = 8.0;
    self.lbb_cardView.clipsToBounds = YES;
    self.lbb_cardView.layer.shadowRadius = 2.0;
    self.lbb_cardView.layer.shadowOffset = CGSizeMake(0, 2);
    self.lbb_cardView.layer.shadowOpacity = 0.25;
    self.lbb_cardView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.lbb_cardView.layer.masksToBounds = NO;
}
@end
