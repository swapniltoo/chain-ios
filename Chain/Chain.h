//
//  Chain.h
//
//  Copyright (c) 2014 Chain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Chain : NSObject
+ (instancetype)sharedInstanceWithToken:(NSString *)token;

- (void)getAddress:(NSString *)address completionHandler:(void (^)(NSDictionary *dictionary, NSError *error))completionHandler;
- (void)sendTransaction:(NSString *)transaction completionHandler:(void (^)(NSDictionary *dictionary, NSError *error))completionHandler;
@end
