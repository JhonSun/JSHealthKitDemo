# JSHealthKitDemo
两种方式计步：
1、使用HealthKit获取：
    这种方式获得步数有误差，因为时区是格林尼治时区，但是可以获取的时间段比较广，并且不仅仅能获取步数。
2、使用Core Motion 加速记和陀螺仪获取：
    这种方式获取的步数更为精准，但是只能获取一个星期以内的数据，并且功能范围较宰。
