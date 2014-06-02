//
//  Chain.m
//
//  Copyright (c) 2014 Chain. All rights reserved.
//

#import "Chain.h"

@implementation Chain

+ (void)getBalance {
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSString *APIToken = @"GUEST-TOKEN";
    NSData *APITokenData = [APIToken dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64EncodedCredential = [APITokenData base64EncodedStringWithOptions:0];
    NSString *authString = [NSString stringWithFormat:@"Basic %@", base64EncodedCredential];
    sessionConfiguration.HTTPAdditionalHeaders = @{@"Accept": @"application/json",
      @"Accept-Language": @"en",
      @"Authorization": authString};
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    NSURL *url = [NSURL URLWithString:@"https://api.chain.com/v1/bitcoin/addresses/17x23dNjXJLzGMev6R63uyRhMWP1VHawKc"];
    [[session dataTaskWithURL:url
            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSLog(@"%@", json);
            }] resume];
}

@end
