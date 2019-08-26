//
//  DMAdmobCustomAd.m
//  DMMediactionDemo
//
//  Created by Wei Ting Chen on 13/10/14.
//  Copyright (c) 2013年 Wei Ting Chen. All rights reserved.
//

#import "AdMobBannerCustomAD.h"
#import <iMFAD/MFBannerView.h>


@implementation AdMobBannerCustomAD

@synthesize delegate;

/// Constant for Sample Ad Network custom event error domain.
static NSString *const customEventErrorDomain = @"com.google.CustomEvent";




- (void)requestBannerAd:(GADAdSize)adSize
              parameter:(NSString *)serverParameter
                  label:(NSString *)serverLabel
                request:(GADCustomEventRequest *)request
{
    
    banner = [[MFBannerView alloc] initWithAdSize:MFAdSize320X50 origin:CGPointMake(0,0)];
    
    [banner setBannerAlignment:Alignment_Center];
    
    [banner setBannerBackgroudColor:[UIColor blackColor]];
    
    
    banner.bannerId = serverParameter ;
    
    banner.delegate = self;
    
    [banner requestAd];
    
    [self.delegate customEventBanner:self didReceiveAd:banner];
    
}

-(void)requestAdSuccess{
    [banner show];
    [self bannerDidLoad:banner];
}

-(void)requestAdFail{
    [self banner:banner didFailToLoadAdWithErrorCode:0];
}

-(void)onClickAd{
    [self bannerWillLeaveApplication:banner];
}

#pragma mark SampleBannerAdDelegate implementation

- (void)bannerDidLoad:(MFBannerView *)banner {
//    [self.delegate customEventBanner:self didReceiveAd:banner];
    NSLog(@"Success Ad");
}

- (void)banner:(MFBannerView *)banner didFailToLoadAdWithErrorCode:(int)errorCode {
    NSError *error = [NSError errorWithDomain:customEventErrorDomain code:errorCode userInfo:nil];
    [self.delegate customEventBanner:self didFailAd:error];
    NSLog(@"No Show Ad");
}

- (void)bannerWillLeaveApplication:(MFBannerView *)banner {
    [self.delegate customEventBannerWasClicked:self];
    [self.delegate customEventBannerWillLeaveApplication:self];
    NSLog(@"Click");
}


@end
