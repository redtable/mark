//
//  MarkViewController.m
//  Mark
//
//  Created by WangSen on 2017/3/28.
//  Copyright © 2017年 WangSen. All rights reserved.
//

#import "MarkViewController.h"
#import "MarkNormalCell.h"

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
    _leftDataArray = [NSMutableArray arrayWithArray:@[@"p1", @"p2", @"p3", @"p4", @"p5"]];
    _rightDataArray = [NSMutableArray arrayWithArray:@[@"q1", @"q2", @"q3", @"q4", @"q5"]];
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
}

#pragma mark TableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellId = @"selectedCellId";
    
    MarkNormalCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil == cell) {
        cell = [[MarkNormalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        Border(cell);
    }
    
    if (tableView == _leftTableView) {
        if (_leftDataArray.count > indexPath.row) {
            cell.shirtView.name = _leftDataArray[indexPath.row];
//            cell.textLabel.text = _leftDataArray[indexPath.row];
            cell.shirtView.color = RGBA(100, 30, 255, 1);
            cell.shirtView.number = [NSString stringWithFormat:@"%ld", indexPath.row + 7];
            if (_selectedPostition.column == 0 && _selectedPostition.line == indexPath.row) {
                [cell selectCell:YES];
            } else {
                [cell selectCell:NO];
            }
        }
    } else if (tableView == _rightTableView) {
        if (_rightDataArray.count > indexPath.row) {
            cell.shirtView.name = _rightDataArray[indexPath.row];
//            cell.textLabel.text = _rightDataArray[indexPath.row];
            cell.shirtView.color = RGBA(230, 230, 230, 1);
            cell.shirtView.number = [NSString stringWithFormat:@"%ld", indexPath.row + 7];
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
//    if (tableView == _leftTableView && _selectedPostition.column == 0) {
//        if (indexPath.row == _selectedPostition.line) {
//            return (ScreenHeight - NavigationBarHeight - 100) / 5 + 50;
//        }
//    } else if (tableView == _rightTableView && _selectedPostition.column == 1) {
//        if (indexPath.row == _selectedPostition.line) {
//            return (ScreenHeight - NavigationBarHeight - 100) / 5 + 50;
//        }
//    }
//    return (ScreenHeight - NavigationBarHeight - 100) / 5;
    return MarkCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
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
