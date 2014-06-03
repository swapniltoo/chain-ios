//
//  Chain.m
//
//  Copyright (c) 2014 Chain. All rights reserved.
//

#import "Chain.h"
#import "CNURLSessionDelegate.h"

@interface Chain()
@property NSString *token;
@end

@implementation Chain

+ (instancetype)sharedInstanceWithToken:(NSString *)token {
    static Chain *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Chain alloc] initWithToken:token];
    });
    return sharedInstance;
}

- (id)initWithToken:(NSString *)token {
    if (self = [super init]) {
        self.token = token;
    }
    return self;
}

#pragma mark - 

- (NSURLSession *)_newChainSession {
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSData *APITokenData = [self.token dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64EncodedCredential = [APITokenData base64EncodedStringWithOptions:0];
    NSString *authString = [NSString stringWithFormat:@"Basic %@", base64EncodedCredential];
    sessionConfiguration.HTTPAdditionalHeaders = @{@"Accept": @"application/json",
                                                   @"Accept-Language": @"en",
                                                   @"Authorization": authString};
    
    CNURLSessionDelegate *sessionDelegate = [[CNURLSessionDelegate alloc] init];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:sessionDelegate delegateQueue:nil];
    return session;
}

+ (NSURL *)_newChainURLWithV1BitcoinPath:(NSString *)path {
    NSString *baseURLString = @"https://api.chain.com/v1/bitcoin";
    NSString *URLString = [NSString stringWithFormat:@"%@/%@", baseURLString, path];
    return [NSURL URLWithString:URLString];
}

#pragma mark -

- (void)getAddress:(NSString *)address completionHandler:(void (^)(NSDictionary *dictionary, NSError *error))completionHandler {
    NSString *pathString = [NSString stringWithFormat:@"addresses/%@", address];
    NSURL *url = [Chain _newChainURLWithV1BitcoinPath:pathString];
    
    [[[self _newChainSession] dataTaskWithURL:url
            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                NSDictionary *returnDictionary = nil;
                NSError *returnError = nil;
                
                if (error) {
                    returnError = error;
                } else {
                    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&returnError];
                    if (returnError == nil) {
                        returnDictionary = json;
                    }
                }
                
                completionHandler(returnDictionary, returnError);
            }] resume];
}

@end
