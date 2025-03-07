//
//  Constants.h
//  Noob
//
//  Created by Ali Razzouk on 9/8/14.
//  Copyright (c) 2014 Scapehouse. All rights reserved.
//

#ifndef SHConstants_h
#define SHConstants_h

/*  --------------------------------------------
    ---------- Runtime Environment -------------
    --------------------------------------------
 */

#define SH_DEVELOPMENT_ENVIRONMENT      NO
#define IS_IOS7                         kCFCoreFoundationVersionNumber > kCFCoreFoundationVersionNumber_iOS_6_1

/*  ---------------------------------------------
    ------------------- API ---------------------
    ---------------------------------------------
 */

#define SH_DOMAIN                               @"scapehouse.com" // scapehouse.dlinkddns.com:2703
#define SH_PORT                                 5222 // Old: 4244
#define SH_PORT_SANDBOX                         5157
#define DB_TEMPLATE_NAME                        @"default_template.sqlite"
#define SPRITES_NAME                            @"sprite_tiles"
#define INIT_TOKEN                              @"54f01568a9e6d50e9190a1e21b1800445585d427"
#define NETWORK_CONNECTION_ATTEMPT_TIMEOUT      5
#define NETWORK_CONNECTION_TIMEOUT              7   // Seconds.
#define MESSAGE_TIMEOUT                         7   // Seconds.

/*  ---------------------------------------------
    ---------- Application Interface ------------
    ---------------------------------------------
 */

#define IS_IPHONE_5                             ( fabs( (double)[ [UIScreen mainScreen] bounds].size.height - (double)568 ) < DBL_EPSILON )

#define RADIANS_TO_DEGREES(radians)             ((radians) * (180.0 / M_PI))
#define DEGREES_TO_RADIANS(angle)               ((angle) / 180.0 * M_PI)

// Fonts
#define MAIN_FONT_SIZE                          18
#define MIN_MAIN_FONT_SIZE                      15
#define SECONDARY_FONT_SIZE                     12
#define MIN_SECONDARY_FONT_SIZE                 10

typedef enum {
    MapDirectionUp = 1,
    MapDirectionDown,
    MapDirectionRight,
    MapDirectionLeft,
    MapDirectionNone
} SHMapDirection;

#endif