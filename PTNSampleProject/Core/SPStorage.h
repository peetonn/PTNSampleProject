//
//  SPStorageController.h
//  PTNSampleProject
//
//  Created by Peter Gusev on 5/25/13.
//  Copyright (c) 2013 Peter Gusev. All rights reserved.
//

#import <PTNArtifacts/PTNArtifacts.h>

#define SP_STORAGE_FILENAME @"Defaults"

/**
 * This class overrides PTNStorage. It is used for storing user defaults of app.
 */
@interface SPStorage : PTNStorage

/**
 * Returns shared instance of storage controller. Creates with SP_DEFAULTS_FILENAME if it was not yet created.
 */
+(SPStorage*)sharedStorageController;

/**
 * Example setting: Date and time of app launching
 */
@property (nonatomic) NSDate *launchDateTime;

/**
 * Example setting: Date and time of app launching
 */
@property (nonatomic) BOOL isFirstLaunch;

@end
