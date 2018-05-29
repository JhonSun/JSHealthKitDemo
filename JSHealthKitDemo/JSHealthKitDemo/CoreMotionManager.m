//
//  CoreMotionManager.m
//  JSHealthKitDemo
//
//  Created by lianditech on 2018/5/25.
//  Copyright © 2018年 lianditech. All rights reserved.
//

#import "CoreMotionManager.h"
#import <CoreMotion/CoreMotion.h>

@interface CoreMotionManager()

@property (nonatomic, strong) CMPedometer *pedometer;

@end

@implementation CoreMotionManager

+ (id)shareInstance {
    static id manager ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[[self class] alloc] init];
    });
    return manager;
}

- (void)getStepCountAndDistanceWithSuccessHandler:(void (^)(NSNumber *, NSNumber *))successHandler errorHandler:(void (^)(NSString *))errorHandler {
    [self getStepCountAndDistanceWithDateString:nil successHandler:successHandler errorHandler:errorHandler];
}

- (void)getStepCountAndDistanceWithDateString:(NSString *)dateString successHandler:(void (^)(NSNumber *, NSNumber *))successHandler errorHandler:(void (^)(NSString *))errorHandler {
    if ([CMPedometer isStepCountingAvailable]) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSDate *now = [NSDate date];
        
        if (dateString.length > 0) {
            now = [dateFormatter dateFromString:dateString];
        }
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:now];
        [components setHour:0];
        [components setMinute:0];
        [components setSecond: 0];
        NSDate *startDate = [self localDateWithDate:[calendar dateFromComponents:components]];
        NSDate *endDate = [calendar dateByAddingUnit:NSCalendarUnitDay value:1 toDate:startDate options:0];
        [self.pedometer queryPedometerDataFromDate:startDate toDate:endDate withHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
            if (error) {
                if (errorHandler) errorHandler([error localizedDescription]);
            } else {
                NSLog(@"开始时间：%@", pedometerData.startDate);
                NSLog(@"结束时间：%@", pedometerData.endDate);
                NSLog(@"步数===%@",pedometerData.numberOfSteps);
                NSLog(@"距离===%@m",pedometerData.distance);
                if (successHandler) successHandler(pedometerData.numberOfSteps, pedometerData.distance);
            }
        }];
    } else {
        NSLog(@"陀螺仪和加速仪不可用");
    }
}

/**
 改变时间为当前时区的时间

 @param date 改变前
 @return 改变后
 */
- (NSDate *)localDateWithDate:(NSDate *)date {
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    
    NSInteger interval = [zone secondsFromGMTForDate: date];
    
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    
    return localeDate;
}

#pragma mark - lazy
- (CMPedometer *)pedometer {
    if (!_pedometer) {
        _pedometer = [[CMPedometer alloc] init];
    }
    return _pedometer;
}

@end
