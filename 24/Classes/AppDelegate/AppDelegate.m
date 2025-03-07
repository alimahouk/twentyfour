//
//  AppDelegate.m
//  24
//
//  Created by MachOSX on 8/19/14.
//  Copyright (c) 2014 Scapehouse. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _screenBounds = [[UIScreen mainScreen] bounds];
    
    _mainView = [[MainViewController alloc] init];
    
    _window = [[UIWindow alloc] initWithFrame:_screenBounds];
    _window.backgroundColor = [UIColor blackColor];
    _window.rootViewController = _mainView;
    [_window makeKeyAndVisible];
    
    return YES;
}

#pragma mark -
#pragma mark Delegate static functions.
// Return a shared delegate.
+ (AppDelegate *)sharedDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [_mainView pauseTimers];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    [_mainView startTimers];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
