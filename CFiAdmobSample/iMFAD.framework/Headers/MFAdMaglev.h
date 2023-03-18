//
//  MFAdMaglev.h
//  iMFAD
//
//  Created by CF-NB on 2019/4/30.
//  Copyright © 2019年 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
typedef NS_OPTIONS(NSInteger, MFAdMaglevLocation) {
    AdMaglevTop = 0x01,
    AdMaglevBOTTOM = 0x5,
    AdMaglevLEFT = 0x10,
    AdMaglevRIGHT = 0x20,
    AdMaglevCENTER = 0x7
} ;

@protocol MFAdMaglevDelegate <NSObject>
@optional
/**廣告請求成功*/
- (void)onSuccessToMFAdMaglev;

/**廣告請求失敗*/
- (void)onFailToMFAdMaglev;

/**廣告點擊*/
- (void)onClickToMFAdMaglev;

/**廣告關閉*/
- (void)onCloseToMFAdMaglev;

@end

@interface MFAdMaglev : UIView
@property (nonatomic, copy) NSString *bannerId;
@property(nonatomic, assign)id<MFAdMaglevDelegate>delegate;

#pragma mark 回傳SDK版本
+ (NSString *)version;

- (id) initWithLocation: (MFAdMaglevLocation) location;

#pragma mark 開始取得廣告
- (void)requestAd;
- (void)requestAdWithNoPrompt;

#pragma mark 顯示取得廣告
- (void)show;

#pragma mark 設定是否輸出除錯訊息
- (void)debugInfo:(BOOL)state;
@end


