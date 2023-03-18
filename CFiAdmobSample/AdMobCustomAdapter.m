//
//  AdMobCustomAdapter.m
//  CFiAdmobSample
//
//  Created by CF-NB on 2023/3/17.
//  Copyright © 2023 clickforce. All rights reserved.
//

#import "AdMobCustomAdapter.h"
#import "AdMobBannerCustomAD.h"


@implementation AdMobCustomAdapter {
    AdMobBannerCustomAD *customAd;
}


#pragma mark GADMediationAdapter implementation

+ (GADVersionNumber)adSDKVersion {
    GADVersionNumber version = {0};
    NSString *ver = [MFBannerView version];
    NSArray *verSplit = [ver componentsSeparatedByString:@"."];
    if (verSplit.count >= 3) {
        version.majorVersion = [verSplit[0] integerValue];
        version.minorVersion = [verSplit[1] integerValue];
        version.patchVersion = [verSplit[2] integerValue];
    }
    return version;
}

+ (nullable Class<GADAdNetworkExtras>)networkExtrasClass {
    return [AdMobCustomAdapter class];
}

+ (GADVersionNumber)adapterVersion {
    GADVersionNumber version = {0};
    NSString *ver = [MFBannerView version];
    NSArray *verSplit = [ver componentsSeparatedByString:@"."];
    if (verSplit.count >= 3) {
        version.majorVersion = [verSplit[0] integerValue];
        version.minorVersion = [verSplit[1] integerValue];
        version.patchVersion = [verSplit[2] integerValue] * 100;
    }
    return version;
}

+ (void)setUpWithConfiguration:(GADMediationServerConfiguration *)configuration completionHandler:(GADMediationAdapterSetUpCompletionBlock)completionHandler {
    completionHandler(nil);
}


- (void)loadBannerForAdConfiguration:(GADMediationBannerAdConfiguration *)adConfiguration completionHandler:(GADMediationBannerLoadCompletionHandler)completionHandler {
    customAd = [[AdMobBannerCustomAD alloc] init];
    [customAd loadBannerForAdConfiguration:adConfiguration completionHandler:completionHandler];
}

@end
