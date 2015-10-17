//
//  OrderTableViewCell.m
//  MeiApp
//
//  Created by QianLei on 15/10/14.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import "OrderTableViewCell.h"

@interface OrderTableViewCell ()

- (IBAction)closeOrderButtonPressed:(UIButton *)sender;
- (IBAction)completeOrderButtonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *orderIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderPhoneLabel;

@end

@implementation OrderTableViewCell

- (void)awakeFromNib {
    // Initialization code
//    self.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)orderCellInfo:(NSString *)info;
{
    self.orderIdLabel.text = info;
    self.orderPhoneLabel.text = [info stringByAppendingString:@"12"];
}

- (IBAction)closeOrderButtonPressed:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(closeOrderCell:)]) {
        [self.delegate closeOrderCell:self];
    }
}

- (IBAction)completeOrderButtonPressed:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(completeOrderCell:)]) {
        [self.delegate completeOrderCell:self];
    }
}
@end
