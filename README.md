# Chain

The Official iOS SDK for Chain's Bitcoin API.

## Install

Chain is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```
pod "Chain"
```

## Quick Start

```objc
#import "Chain.h"

Chain *chain = [Chain sharedInstanceWithToken:@"GUEST-TOKEN"];
[chain getAddress:@"1A3tnautz38PZL15YWfxTeh8MtuMDhEPVB" completionHandler:^(NSDictionary *dictionary, NSError *error) {
  NSLog(@"data=%@ error=%@", dictionary, error);
}];

[chain getUnspents:@"1A3tnautz38PZL15YWfxTeh8MtuMDhEPVB" completionHandler:^(NSDictionary *dictionary, NSError *error) {
  NSLog(@"data=%@ error=%@", dictionary, error);
}];

[chain sendTransaction:@"<hex>" completionHandler:^(NSDictionary *dictionary, NSError *error) {
  NSLog(@"data=%@ error=%@", dictionary, error);
}];
```
