//
//  DMAdmobCustomAd.h
//  DMMediactionDemo
//
//  Created by Wei Ting Chen on 13/10/14.
//  Copyright (c) 2013年 Wei Ting Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <iMFAD/MFBannerView.h>
@import GoogleMobileAds;

@interface AdMobBannerCustomAD : NSObject<MFBannerDelegate,GADCustomEventBanner>
{
    MFBannerView *banner;
}

@property(nonatomic, assign)id delegate;

@end
