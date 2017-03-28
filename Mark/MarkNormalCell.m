//
//  MarkNormalCell.m
//  Mark
//
//  Created by WangSen on 2017/3/28.
//  Copyright © 2017年 WangSen. All rights reserved.
//

#import "MarkNormalCell.h"

@interface MarkNormalCell()

@end

@implementation MarkNormalCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _shirtView = [[ShirtView alloc]initWithFrame:CGRectMake(12, 12, MarkCellWidth - 24, MarkCellHeight - 24)];
        [self.contentView addSubview:_shirtView];
    }
    return self;
}

- (void)selectCell:(BOOL)isSelected {
    if (isSelected) {
        _shirtView.frame = CGRectMake(1, 1, MarkCellWidth - 2, MarkCellHeight - 2);
    } else {
        _shirtView.frame = CGRectMake(12, 12, MarkCellWidth - 24, MarkCellHeight - 24);
    }
}

@end

// ===============================================

@interface MarkHighlightedCell()

@end

@implementation MarkHighlightedCell



@end
