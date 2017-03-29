//
//  MarkShowCell.h
//  Mark
//
//  Created by WangSen on 2017/3/28.
//  Copyright © 2017年 WangSen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MarkNormalCell.h"
#import "OperationModel.h"

#define MarkShowCellHeight (ScreenHeight - NavigationBarHeight - 100) / 10

@interface MarkShowCell : UITableViewCell

@property (nonatomic, strong) UILabel * itemNameLabel;
@property (nonatomic, strong) UILabel * leftLabel;
@property (nonatomic, strong) UILabel * rightLabel;

@end
