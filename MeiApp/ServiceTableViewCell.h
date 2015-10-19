//
//  ServiceTableViewCell.h
//  MeiApp
//
//  Created by QianLei on 15/10/19.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ServiceTableViewCell;
@protocol ServiceCellDelegate <NSObject>
@required
- (void)editServiceCell:(ServiceTableViewCell *)cell;
@end

@interface ServiceTableViewCell : UITableViewCell
@property (nonatomic,weak) id<ServiceCellDelegate> delegate;
- (void)serviceCellInfo:(NSString *)info;
@end
