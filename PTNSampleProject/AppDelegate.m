//
//  AppDelegate.m
//  PTNSampleProject
//
//  Created by Peter Gusev on 5/25/13.
//  Copyright (c) 2013 Peter Gusev. All rights reserved.
//

#import "AppDelegate.h"
#import <PTNArtifacts/PTNArtifacts.h>
#import "SPStorage.h"

#define SP_LOG_FILENAME @"default.log"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [PTNLogger logToFile:SP_LOG_FILENAME];
    LOG_INFO(@"Sample project started. Logging into %@ file (LOG_FILENAME macro).", SP_LOG_FILENAME);
    /*LOG_DEBUG(@"Log levels are controled by presence of following preprocessor macros in build settings of a project. They can be overriden in .m files as well.");
    LOG_INFO(@"Trace logging - PTN_LOG_TRACE macro \n\
             Debug logging - PTN_LOG_DEBUG macro\n\
             Info logging - PTN_LOG_INFO macro\n\
             Warnings logging - PTN_LOG_WARN macro\n\
             Error logging - PTNL_LOG_ERROR macro");
    LOG_TRACE(@"Trace log example");
    LOG_DEBUG(@"Debug log example");
    LOG_WARN(@"Warning log example");
    LOG_ERROR(@"Error log example");*/
    
    if (![[SPStorage sharedStorageController] wasAppEndedNormally])
        LOG_WARN(@"Application was not ended normally. Crash log:\n%@",[PTNLogger getLogFile:SP_LOG_FILENAME]);
    else
        [[SPStorage sharedStorageController] setAppEndedNormally:NO];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [[SPStorage sharedStorageController] setAppEndedNormally:YES];
}

@end
