//
//  ServiceTableViewCell.m
//  MeiApp
//
//  Created by QianLei on 15/10/19.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import "ServiceTableViewCell.h"

@interface ServiceTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *serviceNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *serviceImageView;
@property (weak, nonatomic) IBOutlet UILabel *serviceTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *servicePriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *serviceDetailLabel;
- (IBAction)serviceEditButtonPressed:(id)sender;


@end

@implementation ServiceTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)serviceCellInfo:(NSString *)info;
{
    self.serviceNameLabel.text = @"服务名称";
    self.serviceImageView.image = [UIImage imageNamed:@"Test"];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)serviceEditButtonPressed:(id)sender {
    if ([self.delegate respondsToSelector:@selector(editServiceCell:)]) {
        [self.delegate editServiceCell:self];
    }
}
@end
