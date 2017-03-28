//
//  ViewController.m
//  Mark
//
//  Created by WangSen on 2017/3/28.
//  Copyright © 2017年 WangSen. All rights reserved.
//

#import "ViewController.h"
#import "MarkViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 30);
    [btn setTitle:@"Mark" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    ShirtView * shirt = [[ShirtView alloc]initWithFrame:CGRectMake(100, 150, 100, 100)];
    shirt.name = @"西里热江";
    shirt.number = @"00";
    shirt.color = RGBA(100, 100, 255, 1);
    [self.view addSubview:shirt];
    
    ShirtView * shirt1 = [[ShirtView alloc]initWithFrame:CGRectMake(220, 150, 80, 110)];
    shirt1.name = @"James";
    shirt1.number = @"6";
    shirt1.color = RGBA(100, 100, 255, 1);
    [self.view addSubview:shirt1];
    
    ShirtView * shirt2 = [[ShirtView alloc]initWithFrame:CGRectMake(100, 280, 60, 50)];
    shirt2.name = @"李明";
    shirt2.number = @"11";
    shirt2.color = RGBA(100, 100, 255, 1);
    [self.view addSubview:shirt2];
    
    ShirtView * shirt3 = [[ShirtView alloc]initWithFrame:CGRectMake(220, 280, 70, 70)];
    shirt3.name = @"阿的江";
    shirt3.number = @"99";
    shirt3.color = RGBA(100, 100, 255, 1);
    [self.view addSubview:shirt3];
    
    ShirtView * shirt4 = [[ShirtView alloc]initWithFrame:CGRectMake(100, 380, 40, 40)];
    shirt4.name = @"Mutombo";
    shirt4.number = @"33";
    shirt4.color = RGBA(100, 100, 255, 1);
    [self.view addSubview:shirt4];
    
}

- (void)tapButton:(UIButton *)btn {
    MarkViewController * mark = [[MarkViewController alloc]init];
    [self.navigationController pushViewController:mark animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
