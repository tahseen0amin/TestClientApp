//
//  ConfigConstants.h
//  LittleBlackBook
//
//  Created by MyCityForKids on 25/05/16.
//  Copyright © 2016 Tasin Zarkoob. All rights reserved.
//

#ifndef ConfigConstants_h
#define ConfigConstants_h


#define kInstagramBaseURLString @"https://api.instagram.com/v1/"
#define kClientId  @"ff00e90cc50d4c4fb1881f4ac2353cb0"
#define kRedirectUrl  @"http://taazuh.co.uk"
#define kUserAccessTokenKey @"UserAccessTokenKey"

//Flikr
#define FLIKR_API_KEY @"f19871015cd53a8fd76e62a47fd0b5a7"
#define FLIKR_RECENT_PHOTOS @"https://api.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=f19871015cd53a8fd76e62a47fd0b5a7&format=json&extras=url_m&nojsoncallback=?"



// Endpoints
#define kUserMediaRecentEndpoint  @"users/%@/media/recent";
#define kSearchTagEndpoint @"tags/ifoundawesome/media/recent"
#define kAuthenticationEndpoint  @"https://instagram.com/oauth/authorize/?client_id=%@&redirect_uri=%@&response_type=token&scope=public_content"


typedef enum {
    MediaSelectedStateUNDECIDED = 0,
    MediaSelectedStateLIKED,
    MediaSelectedStateDISLIKED
    
} MediaSelectedState;

#endif /* ConfigConstants_h */
