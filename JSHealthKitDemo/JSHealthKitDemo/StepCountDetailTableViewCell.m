//
//  StepCountDetailTableViewCell.m
//  JSHealthKitDemo
//
//  Created by lianditech on 2018/5/29.
//  Copyright © 2018年 lianditech. All rights reserved.
//

#import "StepCountDetailTableViewCell.h"

@implementation StepCountDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
