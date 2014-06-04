//
//  CNViewController.m
//  Hello Chain
//
//  Created by Matt Matteson on 6/2/14.
//  Copyright (c) 2014 Chain. All rights reserved.
//

#import "CNViewController.h"
#import "Chain.h"

@interface CNViewController ()

@end

@implementation CNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[Chain sharedInstance] getAddress:@"1A3tnautz38PZL15YWfxTeh8MtuMDhEPVB" completionHandler:^(NSDictionary *dictionary, NSError *error) {
        if(error) {
            NSLog(@"Chain error: %@", error);
        } else {
            double balance = [[dictionary objectForKey:@"balance"] doubleValue];
            float btc = balance / 100000000.0;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self writeAddressBalance:[NSString stringWithFormat:@"Balance: %f", btc]];
            });
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)writeAddressBalance:(NSString *)balance
{
    UILabel *pageTitle = [[UILabel alloc] init];
    [pageTitle setFrame:self.view.frame];
    [pageTitle setText:balance];
    [pageTitle setFont:[UIFont fontWithName:@"Avenir" size:20.0]];
    [pageTitle setTextColor:[UIColor whiteColor]];
    [pageTitle setBackgroundColor:[UIColor clearColor]];
    [pageTitle setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:pageTitle];
}

@end
