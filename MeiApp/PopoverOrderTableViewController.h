//
//  PopoverOrderTableViewController.h
//  MeiApp
//
//  Created by QianLei on 15/10/20.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QZPopoverDelegate <NSObject>

- (void)selectedPopoverIndexPath:(NSIndexPath *)indexPath;

@end

@interface PopoverOrderTableViewController : UITableViewController

@property (nonatomic, weak) id<QZPopoverDelegate> delegate;

@end
