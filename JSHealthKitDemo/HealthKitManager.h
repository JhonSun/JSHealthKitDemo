//
//  HealthKitManager.h
//  JSHealthKitDemo
//  按照格林尼治时区，所以有误差
//  Created by lianditech on 2018/5/25.
//  Copyright © 2018年 lianditech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

typedef void (^SuccessHandlerBlock)(CGFloat value);
typedef void (^ErrorHandlerBlock)(NSString *errorString);

@interface HealthKitManager : NSObject

+ (id)shareInstance;

/**
 验证权限

 @param compltion 验证回调
 */
- (void)authorizeHealthKit:(void(^)(BOOL success, NSError *error))compltion;

/**
 获取当天的步数

 @param successHandler 成功回调
 @param errorHandler 失败回调
 */
- (void)getStepCountWithSuccessHandler:(SuccessHandlerBlock)successHandler errorHandler:(ErrorHandlerBlock)errorHandler;

/**
 获取当天的距离

 @param successHandler 成功回调
 @param errorHandler 失败回调
 */
- (void)getDistanceWithSuccessHandler:(SuccessHandlerBlock)successHandler errorHandler:(ErrorHandlerBlock)errorHandler;

/**
 获取某天的步数

 @param dateString 某天日期 格式yyyy-MM-dd
 @param successHandler 成功回调
 @param errorHandler 失败回调
 */
- (void)getStepCountWithDateString:(NSString *)dateString successHandler:(SuccessHandlerBlock)successHandler errorHandler:(ErrorHandlerBlock)errorHandler;

/**
 获取某天的行走距离
 
 @param dateString 某天日期 格式yyyy-MM-dd
 @param successHandler 成功回调
 @param errorHandler 失败回调
 */
- (void)getDistanceWithDateString:(NSString *)dateString successHandler:(SuccessHandlerBlock)successHandler errorHandler:(ErrorHandlerBlock)errorHandler;

@end
