//
//  main.m
//  PTNSampleProject
//
//  Created by Peter Gusev on 5/25/13.
//  Copyright (c) 2013 Peter Gusev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import <PTNArtifacts/PTNArtifacts.h>

int main(int argc, char *argv[])
{
    @autoreleasepool {
        int result = 0;
        @try {
            result = UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        }
        @catch (NSException *exception) {
            LOG_ERROR(@"Caught exception: %@ (description: %@) with callstack: \n%@", [exception name], [exception description], [exception callStackSymbols]);
        }
        
        return result;
    }
}
