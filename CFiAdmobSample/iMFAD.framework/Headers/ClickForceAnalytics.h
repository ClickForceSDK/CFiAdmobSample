//
//  NSObject+ClickForceAnalytics.h
//  iMFAD
//
//  Created by CF-NB on 2023/3/5.
//  Copyright © 2023 Charles. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClickForceAnalytics : NSObject
+(ClickForceAnalytics *) instance;
-(void) sendTrack:(NSString *) zoneId;
@end
