//
//  ViewController.m
//  JSHealthKitDemo
//
//  Created by lianditech on 2018/5/25.
//  Copyright © 2018年 lianditech. All rights reserved.
//

#import "ViewController.h"
#import "HealthKitManager.h"
#import "CoreMotionManager.h"

@interface ViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *dateTextField;
@property (weak, nonatomic) IBOutlet UILabel *stepCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - action
- (IBAction)getStepCountAction:(id)sender {
    HealthKitManager *manager = [HealthKitManager shareInstance];
    [manager authorizeHealthKit:^(BOOL success, NSError *error) {
        if (success) {
            [manager getStepCountWithDateString:self.dateTextField.text successHandler:^(CGFloat value) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.stepCountLabel.text = [NSString stringWithFormat:@"步数：%.f", value];
                });
                
            } errorHandler:^(NSString *errorString) {
                NSLog(@"获取步数失败，失败原因：%@", errorString);
            }];
        } else {
            NSLog(@"您没有权限访问健康数据");
        }
    }];
    
}

- (IBAction)getDistanceAction:(id)sender {
    HealthKitManager *manager = [HealthKitManager shareInstance];
    [manager authorizeHealthKit:^(BOOL success, NSError *error) {
        if (success) {
            [manager getDistanceWithDateString:self.dateTextField.text successHandler:^(CGFloat value) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.distanceLabel.text = [NSString stringWithFormat:@"距离：%.2fkm", value];
                });
                
            } errorHandler:^(NSString *errorString) {
                NSLog(@"获取距离失败，失败原因：%@", errorString);
            }];
        } else {
            NSLog(@"您没有权限访问健康数据");
        }
    }];
}

- (IBAction)getStepAndDistanceAction:(id)sender {
    // 更加准确
    [[CoreMotionManager shareInstance] getStepCountAndDistanceWithDateString:self.dateTextField.text successHandler:^(NSNumber *stepCount, NSNumber *distance) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.stepCountLabel.text = [NSString stringWithFormat:@"步数：%.f", [stepCount floatValue]];
            self.distanceLabel.text = [NSString stringWithFormat:@"距离：%.2fkm", [distance floatValue] / 1000];
        });
    } errorHandler:^(NSString *errorString) {
        NSLog(@"获取失败，失败原因：%@", errorString);
    }];
}

- (IBAction)clearDataAction:(id)sender {
    self.stepCountLabel.text = @"步数：0";
    self.distanceLabel.text = @"距离：0km";
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [textField resignFirstResponder];
}

@end
