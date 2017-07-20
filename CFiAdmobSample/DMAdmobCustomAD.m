//
//  DMAdmobCustomAd.m
//  DMMediactionDemo
//
//  Created by Wei Ting Chen on 13/10/14.
//  Copyright (c) 2013年 Wei Ting Chen. All rights reserved.
//

#import "DMAdmobCustomAD.h"
#import "MFBannerView.h"


@implementation DMAdmobCustomAD

@synthesize delegate;

/// Constant for Sample Ad Network custom event error domain.
static NSString *const customEventErrorDomain = @"com.google.CustomEvent";




- (void)requestBannerAd:(GADAdSize)adSize
              parameter:(NSString *)serverParameter
                  label:(NSString *)serverLabel
                request:(GADCustomEventRequest *)request
{
    
    MFBannerView *banner = [[MFBannerView alloc] initWithAdSize:MFAdSize320X50 origin:CGPointMake(0,0)];
    
    [banner setBannerAlignment:Alignment_Center];
    
    [banner setBannerBackgroudColor:[UIColor blackColor]];
    
    
    banner.bannerId = serverParameter ;
    
    [banner requestAd];
    
    [self.delegate customEventBanner:self didReceiveAd:banner];
    
}

#pragma mark SampleBannerAdDelegate implementation

- (void)bannerDidLoad:(MFBannerView *)banner {
    [self.delegate customEventBanner:self didReceiveAd:banner];
}

- (void)banner:(MFBannerView *)banner didFailToLoadAdWithErrorCode:(int)errorCode {
    NSError *error = [NSError errorWithDomain:customEventErrorDomain code:errorCode userInfo:nil];
    [self.delegate customEventBanner:self didFailAd:error];
}

- (void)bannerWillLeaveApplication:(MFBannerView *)banner {
    [self.delegate customEventBannerWasClicked:self];
    [self.delegate customEventBannerWillLeaveApplication:self];
}

@end
