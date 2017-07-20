//
//  AppDelegate.h
//  CFiAdmobSample
//
//  Created by Charles on 2017/7/20.
//  Copyright © 2017年 clickforce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

