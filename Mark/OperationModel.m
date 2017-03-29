//
//  OperationModel.m
//  Mark
//
//  Created by WangSen on 2017/3/29.
//  Copyright © 2017年 WangSen. All rights reserved.
//

#import "OperationModel.h"

@implementation OperationModel

- (instancetype)initWithType:(OperationType)type player:(PlayerModel *)player {
    if (self = [super init]) {
        _opType = type;
        _player = player;
        if (type == OperationType3) {
            _value = 3;
        } else if (type == OperationType2) {
            _value = 2;
        } else {
            _value = 1;
        }
    }
    return self;
}

- (NSString *)getDescriptionString {
    NSString * des = [NSString stringWithFormat:@"%@ %ld +%ld", _player.name, _opType, _value];
    return des;
}

@end


@implementation PlayerModel

@end

@implementation TeamModel

@end
