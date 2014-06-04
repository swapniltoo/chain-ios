//
//  CNAppDelegate.m
//  Hello Chain
//
//  Copyright (c) 2014 Chain. All rights reserved.
//

#import "CNAppDelegate.h"
#import "Chain.h"

@implementation CNAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Chain sharedInstanceWithToken:@"GUEST-TOKEN"];
    return YES;
}

@end
