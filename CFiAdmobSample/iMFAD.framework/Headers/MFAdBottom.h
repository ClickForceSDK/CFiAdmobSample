//
//  MFAdBottom.h
//  iMFAD
//
//  Created by Eric Chen on 2022/2/24.
//  Copyright © 2022 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol MFAdBottomDelegate <NSObject>
@optional
/**廣告請求成功*/
-(void)onSuccessToMFAdBottom;

/**廣告請求失敗*/
-(void)onFailToMFAdBottom;

/**廣告點擊*/
-(void)onClickToMFAdBottom;

/**廣告關閉*/
-(void)onCloseToMFAdBottom;
@end

@interface MFAdBottom : UIView
@property(nonatomic, copy) NSString *bannerId;
@property(nonatomic, assign)id<MFAdBottomDelegate> delegate;

#pragma mark 回傳SDK回傳
+ (NSString *)version;

#pragma mark 取得廣告
- (void) requestAd;
- (void) requestAdWithNoPrompt;

#pragma mark 顯示廣告
- (void) show;

#pragma mark 設定是否輸出除錯訊息
- (void) debugInfo:(BOOL) state;

@end
