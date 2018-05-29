//
//  StepModel.h
//  JSHealthKitDemo
//
//  Created by lianditech on 2018/5/29.
//  Copyright © 2018年 lianditech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface StepModel : NSObject

@property (nonatomic, assign) NSInteger stepCount;// 步数
@property (nonatomic, assign) CGFloat distance;// 距离
@property (nonatomic, strong) NSDate *startDate;// 开始时间
@property (nonatomic, strong) NSDate *endDate;// 结束时间

@end
