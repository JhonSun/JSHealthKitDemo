//
//  CoreMotionManager.h
//  JSHealthKitDemo
//  比较精确，时区可以自己调整,但是只能获取一周以内的数据
//  Created by lianditech on 2018/5/25.
//  Copyright © 2018年 lianditech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreMotionManager : NSObject

+ (id)shareInstance;

/**
 获取当天的步数和距离

 @param successHandler 成功回调
 @param errorHandler 失败回调
 */
- (void)getStepCountAndDistanceWithSuccessHandler:(void(^)(NSNumber *stepCount, NSNumber *distance))successHandler errorHandler:(void(^)(NSString *))errorHandler;
/**
 获取距离和步数

 @param dateString 日期，格式yyyy-MM-dd
 @param successHandler 成功回调
 @param errorHandler 失败回调
 */
- (void)getStepCountAndDistanceWithDateString:(NSString *)dateString successHandler:(void(^)(NSNumber *stepCount, NSNumber *distance))successHandler errorHandler:(void(^)(NSString *))errorHandler;

@end
