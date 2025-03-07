//
//  AppDelegate.h
//  24
//
//  Created by MachOSX on 8/19/14.
//  Copyright (c) 2014 Scapehouse. All rights reserved.
//

#import "MainViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    
}

@property (nonatomic) CGRect screenBounds;
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MainViewController *mainView;

+ (AppDelegate *)sharedDelegate;

@end
