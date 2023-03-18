//
//  MFBottomScrollView.h
//  iMFAD
//
//  Created by CF-NB on 2019/10/25.
//  Copyright © 2019 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol MFAdBottomScrollViewDelegate <NSObject>
@optional
/**廣告請求成功*/
-(void)onSuccessToMFAdBottomScrollView;

/**廣告請求失敗*/
-(void)onFailToMFAdBottomScrollView;

/**廣告點擊*/
-(void)onClickToMFAdBottomScrollView;

/**廣告關閉*/
-(void)onCloseToMFAdBottomScrollView;

@end

@interface MFAdBottomScrollView : UIView
@property(nonatomic, copy) NSString *bannerId;
@property(nonatomic, assign)id<MFAdBottomScrollViewDelegate>delegate;

#pragma mark 回傳SDK版本
+ (NSString *)version;

#pragma mark 開始取得廣告
- (void)requestAd;
- (void)requestAdWithNoPrompt;

#pragma mark 顯示取得廣告
- (void)show;

#pragma mark 設定是否輸出除錯訊息
- (void)debugInfo:(BOOL)state;

#pragma mark 設定看以滑動的View
- (void)setScrollview:(UIView *) sc;

@end
