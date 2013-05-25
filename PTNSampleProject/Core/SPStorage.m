//
//  SPStorageController.m
//  PTNSampleProject
//
//  Created by Peter Gusev on 5/25/13.
//  Copyright (c) 2013 Peter Gusev. All rights reserved.
//

#import "SPStorage.h"

@implementation SPStorage

+(SPStorage*)sharedStorage
{
    if (![PTNStorage isSharedStorageControllerInitialized])
        [PTNStorage setSharedStorageController:[[SPStorage alloc] initWithStorageFile:SP_STORAGE_FILENAME]];
    
    return (SPStorage*)[PTNStorage sharedStorageController];
}

@end
