//
//  MarkShowCell.m
//  Mark
//
//  Created by WangSen on 2017/3/28.
//  Copyright © 2017年 WangSen. All rights reserved.
//

#import "MarkShowCell.h"

@interface MarkShowCell()



@end

@implementation MarkShowCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        CGFloat cellWidth = ScreenWidth - MarkCellWidth * 2;
        CGFloat itemWidth = 80;
        CGFloat otherWidth = (cellWidth - itemWidth) / 2;
        CGFloat itemHeight = MarkShowCellHeight;
        
        _leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, otherWidth, itemHeight)];
        _leftLabel.textAlignment = NSTextAlignmentCenter;
        _leftLabel.font = NormalFont(13);
        _leftLabel.adjustsFontSizeToFitWidth = YES;
        _leftLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_leftLabel];
        
        _rightLabel = [[UILabel alloc]initWithFrame:CGRectMake(otherWidth + itemWidth, 0, otherWidth, itemHeight)];
        _rightLabel.textAlignment = NSTextAlignmentCenter;
        _rightLabel.font = NormalFont(13);
        _rightLabel.adjustsFontSizeToFitWidth = YES;
        _rightLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_rightLabel];
        
        _itemNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(otherWidth, 0, itemWidth, itemHeight)];
        _itemNameLabel.textAlignment = NSTextAlignmentCenter;
        _itemNameLabel.font = NormalFont(13);
        _itemNameLabel.adjustsFontSizeToFitWidth = YES;
        _itemNameLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_itemNameLabel];
//        Border(_itemNameLabel);
        
    }
    return self;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    if (selected) {
        BorderColor(_itemNameLabel, [UIColor redColor]);
    } else {
        BorderColor(_itemNameLabel, [UIColor clearColor]);
    }
    // Configure the view for the selected state
}

@end
