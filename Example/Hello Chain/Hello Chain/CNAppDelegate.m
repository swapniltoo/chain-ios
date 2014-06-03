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
    Chain *chainInstance = [Chain sharedInstanceWithToken:@"GUEST-TOKEN"];
    
    [chainInstance getAddress:@"1A3tnautz38PZL15YWfxTeh8MtuMDhEPVB" completionHandler:^(NSDictionary *dictionary, NSError *error) {
        NSLog(@"data=%@ error=%@", dictionary, error);
    }];
    
    [chainInstance sendTransaction:@"" completionHandler:^(NSDictionary *dictionary, NSError *error) {
        NSLog(@"data=%@ error=%@", dictionary, error);
    }];
    
    return YES;
}

@end
