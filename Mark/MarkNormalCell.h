//
//  MarkNormalCell.h
//  Mark
//
//  Created by WangSen on 2017/3/28.
//  Copyright © 2017年 WangSen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShirtView.h"

#define MarkCellWidth 80
#define MarkCellHeight 80

@interface MarkNormalCell : UITableViewCell

@property (nonatomic, strong) ShirtView * shirtView;
- (void)selectCell:(BOOL)isSelected;
@end

@interface MarkHighlightedCell : UITableViewCell

@end
