//
//  CNViewController.m
//  Hello Chain
//
//  Copyright (c) 2014 Chain. All rights reserved.
//

#import "CNViewController.h"
#import "Chain.h"

@interface CNViewController ()
@property (nonatomic) UILabel* balanceLabel;
@end

@implementation CNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.balanceLabel];
    
    [[Chain sharedInstance] getAddress:@"1A3tnautz38PZL15YWfxTeh8MtuMDhEPVB" completionHandler:^(NSDictionary *dictionary, NSError *error) {
        if(error) {
            NSLog(@"Chain error: %@", error);
        } else {
            double balance = [[dictionary objectForKey:@"balance"] doubleValue];
            float btc = balance / 100000000.0;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.balanceLabel setText:[NSString stringWithFormat:@"Balance: %f", btc]];
            });
        }
    }];
}

- (UILabel *)balanceLabel {
    if (!_balanceLabel) {
        _balanceLabel = [[UILabel alloc] init];
        [_balanceLabel setFrame:self.view.frame];
        [_balanceLabel setFont:[UIFont fontWithName:@"Avenir" size:20.0]];
        [_balanceLabel setTextColor:[UIColor whiteColor]];
        [_balanceLabel setBackgroundColor:[UIColor clearColor]];
        [_balanceLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _balanceLabel;
}
@end
