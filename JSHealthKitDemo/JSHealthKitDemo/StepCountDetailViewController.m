//
//  StepCountDetailViewController.m
//  JSHealthKitDemo
//
//  Created by lianditech on 2018/5/29.
//  Copyright © 2018年 lianditech. All rights reserved.
//

#import "StepCountDetailViewController.h"
#import "StepCountDetailTableViewCell.h"
#import "StepModel.h"

@interface StepCountDetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSDateFormatter *dateFormatter;

@end

@implementation StepCountDetailViewController

static NSString *const cellIdf = @"cellIdf";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([StepCountDetailTableViewCell class]) bundle:nil] forCellReuseIdentifier:cellIdf];
    self.tableView.tableFooterView = [UIView new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StepCountDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdf forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.stepCountLabel.text = @"步数/距离";
        cell.startDateLabel.text = @"开始时间";
        cell.endDateLabel.text = @"结束时间";
    } else {
        StepModel *model = self.dataArray[indexPath.row - 1];
        if (model.stepCount > 0) {
            cell.stepCountLabel.text = [NSString stringWithFormat:@"%i步", model.stepCount];
        } else {
            cell.stepCountLabel.text = [NSString stringWithFormat:@"%.1fm", model.distance];
        }
        
        cell.startDateLabel.text = [self.dateFormatter stringFromDate:model.startDate];
        cell.endDateLabel.text = [self.dateFormatter stringFromDate:model.endDate];
    }
    return cell;
}

#pragma mark - lazy
- (NSDateFormatter *)dateFormatter {
    if (!_dateFormatter) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }
    return _dateFormatter;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
