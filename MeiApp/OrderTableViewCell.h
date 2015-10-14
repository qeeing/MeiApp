//
//  OrderTableViewCell.h
//  MeiApp
//
//  Created by QianLei on 15/10/14.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class OrderTableViewCell;

@protocol OrderCellDelegate <NSObject>
@required
- (void)closeOrderCell:(OrderTableViewCell *)cell;
- (void)completeOrderCell:(OrderTableViewCell *)cell;

@end

@interface OrderTableViewCell : UITableViewCell

@property (nonatomic,weak) id<OrderCellDelegate> delegate;

- (void)orderCellInfo:(NSString *)info;

@end
