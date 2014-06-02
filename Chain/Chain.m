//
//  Chain.m
//
//  Copyright (c) 2014 Chain. All rights reserved.
//

#import "Chain.h"

@implementation Chain

+ (void)getBalance {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"https://GUEST-TOKEN@api.chain.com/v1/bitcoin/addresses/17x23dNjXJLzGMev6R63uyRhMWP1VHawKc"];
    [[session dataTaskWithURL:url
            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSLog(@"%@", json);
            }] resume];
}

@end
