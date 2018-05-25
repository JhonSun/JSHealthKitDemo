//
//  AppDelegate.h
//  JSHealthKitDemo
//
//  Created by lianditech on 2018/5/25.
//  Copyright © 2018年 lianditech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

