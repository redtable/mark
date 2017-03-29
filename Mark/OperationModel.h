//
//  OperationModel.h
//  Mark
//
//  Created by WangSen on 2017/3/29.
//  Copyright © 2017年 WangSen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, OperationType) {
    OperationType3,
    OperationType2,
    OperationTypeR
};
@class TeamModel;
@class PlayerModel;
@interface OperationModel : NSObject

@property (nonatomic, assign) OperationType opType;
@property (nonatomic, assign) NSInteger value;
@property (nonatomic, strong) PlayerModel * player;

- (instancetype)initWithType:(OperationType)type player:(PlayerModel *)player;
- (NSString *)getDescriptionString;

@end


@interface PlayerModel : NSObject

@property (nonatomic, strong) TeamModel * team;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * number;

@end


@interface TeamModel : NSObject

@property (nonatomic, copy) NSString * name;
@property (nonatomic, strong) NSMutableArray <PlayerModel *>*array;

@end

