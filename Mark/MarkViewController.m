//
//  MarkViewController.m
//  Mark
//
//  Created by WangSen on 2017/3/28.
//  Copyright © 2017年 WangSen. All rights reserved.
//

#import "MarkViewController.h"
#import "MarkNormalCell.h"
#import "MarkShowCell.h"

struct Position {
    NSInteger column;
    NSInteger line;
};

@interface MarkViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray * dataArray;

@property (nonatomic, strong) UITableView * leftTableView;
@property (nonatomic, strong) UITableView * rightTableView;
@property (nonatomic, strong) NSMutableArray * leftDataArray;
@property (nonatomic, strong) NSMutableArray * rightDataArray;

@property (nonatomic, strong) UITableView * centerTableView;
@property (nonatomic, strong) NSMutableArray * itemDataArray;

@property (nonatomic, strong) UILabel * leftValueLabel;
@property (nonatomic, strong) UILabel * rightValueLabel;
@property (nonatomic, strong) UILabel * progrerssLabel;

@property (nonatomic, assign) struct Position selectedPostition;

@end

@implementation MarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.hidesBackButton = YES;
    self.navigationController.navigationBar.translucent = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _selectedPostition.column = -1; // 0: left  1:right
    _selectedPostition.line = -1; // 0~5
    
    // Do any additional setup after loading the view.
    _leftDataArray = [NSMutableArray arrayWithCapacity:5];
    for (NSInteger i = 0 ; i < 5; i++) {
        PlayerModel * player = [[PlayerModel alloc]init];
        player.name = [NSString stringWithFormat:@"P%ld", i];
        player.number = [NSString stringWithFormat:@"%ld",i];
        [_leftDataArray addObject:player];
    }
    
    
    _rightDataArray = [NSMutableArray arrayWithCapacity:5];
    for (NSInteger i = 0 ; i < 5; i++) {
        PlayerModel * player = [[PlayerModel alloc]init];
        player.name = [NSString stringWithFormat:@"Q%ld", i];
        player.number = [NSString stringWithFormat:@"%ld",i + 30];
        [_rightDataArray addObject:player];
    }
    
    
    _itemDataArray = [NSMutableArray arrayWithArray:@[@"2FG", @"3FG", @"1FG", @"Reb", @"Ass", @"Steal", @"Block"]];
    [self createUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
}

#pragma mark - UI -
- (void)createUI {
    _leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, MarkCellWidth, ScreenHeight - NavigationBarHeight) style:UITableViewStylePlain];
    _leftTableView.delegate = self;
    _leftTableView.dataSource = self;
    _leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _leftTableView.bounces = NO;
    [self.view addSubview:_leftTableView];
    
    _rightTableView = [[UITableView alloc]initWithFrame:CGRectMake(ScreenWidth - MarkCellWidth, 0, MarkCellWidth, ScreenHeight - NavigationBarHeight) style:UITableViewStylePlain];
    _rightTableView.delegate = self;
    _rightTableView.dataSource = self;
    _rightTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _rightTableView.bounces = NO;
    [self.view addSubview:_rightTableView];
    
    UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth - MarkCellWidth * 2, 80)];
    
    _leftValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, FollowW(headerView) / 2, 60)];
    Border(_leftValueLabel);
    [headerView addSubview:_leftValueLabel];
    
    _rightValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(FollowW(headerView) / 2, 0, FollowW(headerView) / 2, 60)];
    Border(_rightValueLabel);
    [headerView addSubview:_rightValueLabel];
    
    _progrerssLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, FollowYH(_leftValueLabel), FollowW(headerView), 20)];
    [headerView addSubview:_progrerssLabel];
    
    _centerTableView = [[UITableView alloc]initWithFrame:CGRectMake(MarkCellWidth, 0, ScreenWidth - MarkCellWidth * 2, ScreenHeight - NavigationBarHeight) style:UITableViewStylePlain];
    _centerTableView.delegate = self;
    _centerTableView.dataSource = self;
    _centerTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _centerTableView.bounces = NO;
    _centerTableView.tableHeaderView = headerView;
    [self.view addSubview:_centerTableView];
}

#pragma mark TableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_centerTableView == tableView) {
        return 10;
    }
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == _centerTableView) {
        static NSString * cellId = @"centerCellId";
        MarkShowCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (nil == cell) {
            cell = [[MarkShowCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        if (_itemDataArray.count > indexPath.row) {
            cell.itemNameLabel.text = _itemDataArray[indexPath.row];
        }
        
        return cell;
    }
    
    static NSString * cellId = @"selectedCellId";
    
    MarkNormalCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil == cell) {
        cell = [[MarkNormalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        Border(cell);
    }
    
    if (tableView == _leftTableView) {
        if (_leftDataArray.count > indexPath.row) {
            PlayerModel * model = [_leftDataArray objectAtIndex:indexPath.row];
            cell.shirtView.name = model.name;
            cell.shirtView.color = RGBA(100, 30, 255, 1);
            cell.shirtView.number = model.number;
            if (_selectedPostition.column == 0 && _selectedPostition.line == indexPath.row) {
                [cell selectCell:YES];
            } else {
                [cell selectCell:NO];
            }
        }
    } else if (tableView == _rightTableView) {
        if (_rightDataArray.count > indexPath.row) {
            PlayerModel * model = [_rightDataArray objectAtIndex:indexPath.row];
            cell.shirtView.name = model.name;
//            cell.textLabel.text = _rightDataArray[indexPath.row];
            cell.shirtView.color = RGBA(230, 230, 230, 1);
            cell.shirtView.number = model.number;
            if (_selectedPostition.column == 1 && _selectedPostition.line == indexPath.row) {
                [cell selectCell:YES];
            } else {
                [cell selectCell:NO];
            }
        }
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (tableView == _centerTableView) {
        return MarkShowCellHeight;
    }
    return MarkCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == _centerTableView) {
        OperationType opType = indexPath.row;
        PlayerModel * player;
        OperationModel * op;
        if (_selectedPostition.column == 0) {
            if (_leftDataArray.count > _selectedPostition.line && _selectedPostition.line >= 0) {
                player = [_leftDataArray objectAtIndex:_selectedPostition.line];
                op = [[OperationModel alloc]initWithType:opType player:player];
            }
        } else if (_selectedPostition.column == 1) {
            if (_rightDataArray.count > _selectedPostition.line && _selectedPostition.line >= 0) {
                player = [_rightDataArray objectAtIndex:_selectedPostition.line];
                op = [[OperationModel alloc]initWithType:opType player:player];
            }
        }
        
        if (op) {
            [_dataArray addObject:op];
            _progrerssLabel.text = [op getDescriptionString];
            [_centerTableView reloadData];
        }
        return;
    }
    
    if (tableView == _leftTableView) {
        _selectedPostition.column = 0;
    } else if (tableView == _rightTableView) {
        _selectedPostition.column = 1;
    }
    _selectedPostition.line = indexPath.row;
    
    [_leftTableView reloadData];
    [_rightTableView reloadData];
}




#pragma mark - Data -
- (void)addData:(id)data {
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:1];
    }
    
    [_dataArray addObject:data];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
