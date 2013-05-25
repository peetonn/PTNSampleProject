//
//  SPStorageController.m
//  PTNSampleProject
//
//  Created by Peter Gusev on 5/25/13.
//  Copyright (c) 2013 Peter Gusev. All rights reserved.
//

#import "SPStorage.h"

// This is the keys, used in SP_STORAGE_FILENAME file (see Defaults.plist file) for sample project
#define SP_PLISTKEY_FIRST_LAUNCH @"First launch"
#define SP_PLISTKEY_LAUNCH_DATETIME @"Launching date&time"

@implementation SPStorage

//********************************************************************
#pragma mark - class methods
+(SPStorage*)sharedStorageController
{
    if (![PTNStorage isSharedStorageControllerInitialized])
        [PTNStorage setSharedStorageController:[[SPStorage alloc] initWithStorageFile:SP_STORAGE_FILENAME]];
    
    return (SPStorage*)[PTNStorage sharedStorageController];
}

//********************************************************************
#pragma mark - properties
-(BOOL)isFirstLaunch
{
    // retrieves parameter with name SP_PLISTKEY_FIRST_LAUNCH and returns its bool value
    return [[self getParamWithName:SP_PLISTKEY_FIRST_LAUNCH] boolValue];
}
-(void)setIsFirstLaunch:(BOOL)isFirstLaunch
{
    // save parameter SP_PLISTKEY_FIRST_LAUNCH to user defaults
    [self saveBool:isFirstLaunch forKey:SP_PLISTKEY_FIRST_LAUNCH];
}
-(NSDate*)launchDateTime
{
    // retrieves parameter with name SP_PLISTKEY_LAUNCH_DATETIME and returns it    
    return [self getParamWithName:SP_PLISTKEY_LAUNCH_DATETIME];
}
-(void)setLaunchDateTime:(NSDate *)launchDateTime
{
    // save parameter SP_PLISTKEY_LAUNCH_DATETIME to user defaults    
    [self saveParam:launchDateTime forKey:SP_PLISTKEY_LAUNCH_DATETIME];
}

@end
