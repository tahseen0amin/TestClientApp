//
//  UIFont+LLBFont.m
//  LittleBlackBook
//
//  Created by MyCityForKids on 25/05/16.
//  Copyright © 2016 Tasin Zarkoob. All rights reserved.
//

#import "UIFont+LLBFont.h"

@implementation UIFont (LLBFont)

+ (UIFont *)llbFontWithSize:(NSInteger)fontSize {
    return [UIFont fontWithName:@"Montserrat-Regular" size:fontSize];
}

+ (UIFont *)llbBoldFontWithSize:(NSInteger)fontSize {
    return [UIFont fontWithName:@"Montserrat-Bold" size:fontSize];
}
@end
