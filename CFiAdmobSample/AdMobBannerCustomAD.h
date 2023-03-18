//
//  AdMobBannerCustomAD
//  CFiAdmobSample
//
//  Created by CF-NB on 2023/3/14.
//  Copyright © 2023 clickforce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <iMFAD/MFBannerView.h>
@import GoogleMobileAds;

@interface AdMobBannerCustomAD : NSObject

- (void)loadBannerForAdConfiguration:(GADMediationBannerAdConfiguration *)adConfig
                   completionHandler:(GADMediationBannerLoadCompletionHandler)adHandler;
@end
