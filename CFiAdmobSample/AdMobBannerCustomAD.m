//
//  AdMobBannerCustomAD
//  CFiAdmobSample
//
//  Created by CF-NB on 2023/3/14.
//  Copyright © 2023 clickforce. All rights reserved.
//

#import "AdMobBannerCustomAD.h"
#include <stdatomic.h>
#import <iMFAD/MFBannerView.h>
#import <Foundation/Foundation.h>

@interface AdMobBannerCustomAD() <MFBannerDelegate, GADMediationBannerAd> {
    MFBannerView *banner;

    GADMediationBannerLoadCompletionHandler _loadCompletionHandler;

    id<GADMediationBannerAdEventDelegate> _adEventDelegate;
}

@end

@implementation AdMobBannerCustomAD

/// Constant for Sample Ad Network custom event error domain.
static NSString *const customEventErrorDomain = @"com.google.CustomEvent";

- (void)loadBannerForAdConfiguration:(GADMediationBannerAdConfiguration *)adConfig completionHandler:(GADMediationBannerLoadCompletionHandler)adHandler {

    __block atomic_flag completionHandlerCalled = ATOMIC_FLAG_INIT;
    __block GADMediationBannerLoadCompletionHandler originalCompletionHandler =
      [adHandler copy];

    _loadCompletionHandler = ^id<GADMediationBannerAdEventDelegate>(
    _Nullable id<GADMediationBannerAd> ad, NSError *_Nullable error) {
        
    if (atomic_flag_test_and_set(&completionHandlerCalled)) {
      return nil;
    }

    id<GADMediationBannerAdEventDelegate> delegate = nil;
    if (originalCompletionHandler) {
      delegate = originalCompletionHandler(ad, error);
    }

    originalCompletionHandler = nil;

    return delegate;
  };

    NSString *zoneId = adConfig.credentials.settings[@"parameter"];
    NSLog(@"Clickforce zoneId: %@", zoneId);

    banner = [[MFBannerView alloc] initWithAdSize:MFAdSize320X50 origin:CGPointMake(0, 0)];
    [banner setBannerAlignment:Alignment_Center];
    [banner setBackgroundColor:[UIColor blackColor]];
    banner.bannerId = zoneId;
    banner.delegate = self;
    [banner requestAd];

}



#pragma mark ClickForce implementation
- (void)requestAdSuccess {
    [banner show];
    dispatch_async(dispatch_get_main_queue(), ^{
        _adEventDelegate = _loadCompletionHandler(self, nil);
    });
    [_adEventDelegate reportImpression];
}

- (void)requestAdFail {
    NSError *error = [NSError errorWithDomain:customEventErrorDomain code:GADErrorNoFill userInfo:nil];
    dispatch_async(dispatch_get_main_queue(), ^{
        _adEventDelegate = _loadCompletionHandler(nil, error);
    });
}

- (void)onClickAd {
    [_adEventDelegate reportClick];
}

#pragma mark GADMediationBannerAd implementation
- (nonnull UIView *)view {
    return banner;
}

@end
