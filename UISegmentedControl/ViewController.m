//
//  ViewController.m
//  UISegmentedControl
//
//  Created by Karma on 16/5/21.
//  Copyright © 2016年 陈昆涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UISegmentedControl *Segmented;
}
@property (nonatomic,weak) UIView *firstview;
@property (nonatomic,weak) UIView *secondview;
@property (nonatomic,weak) UIView *thirdview;

@end

@implementation ViewController
-(UIView *)firstview {
    if (_firstview == nil) {
        UIView *view = [[UIView alloc] init];
        view.frame = CGRectMake(0, 40, self.view.bounds.size.width, self.view.bounds.size.height);
        view.backgroundColor = [UIColor redColor];
        _firstview = view;
        
        [self.view addSubview:_firstview];
    }
    return _firstview;
}

-(UIView *)secondview{
    if (_secondview == nil) {
        UIView *view = [[UIView alloc] init];
        view.frame = CGRectMake(0, 40, self.view.bounds.size.width, self.view.bounds.size.height );
        view.backgroundColor = [UIColor blueColor];
        _secondview = view;
        
        [self.view addSubview:_secondview];
    }
    return _secondview;
}

-(UIView *)thirdview{
    if (_thirdview == nil) {
        UIView *view = [[UIView alloc] init];
        view.frame = CGRectMake(0, 40, self.view.bounds.size.width, self.view.bounds.size.height );
        view.backgroundColor = [UIColor orangeColor];
        _thirdview = view;
        [self.view addSubview:_thirdview];
    }
    return _thirdview;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    /*1.创建UISegmentedControl*/
    
    NSArray* segmenteArray = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4", nil];
    //设置段数
    Segmented = [[UISegmentedControl alloc]initWithItems:segmenteArray];
    //设置位置
    Segmented.frame = CGRectMake(0, 20, self.view.bounds.size.width, 20);
    
    /*2.设置相关属性*/
    //将第一段的标题设置为one
//    [Segmented setTitle:@"one" forSegmentAtIndex:0];
//    //用1的图片为第二段命名
//    [Segmented setImage:[UIImage imageNamed:@"1.jpg"] forSegmentAtIndex:1];
    //图片背景
//    [Segmented insertSegmentWithImage:[UIImage imageNamed:@"3.jpg"] atIndex:2 animated:NO];
    //指定位置插入索引
//    [Segmented insertSegmentWithTitle:@"insert" atIndex:1 animated:NO];
    //移除指定位置的索引
//    [Segmented removeSegmentAtIndex:0 animated:NO];
    //设置指定索引的宽度
    [Segmented setWidth:10.0f forSegmentAtIndex:3];
    //  Segmented.selectedSegmentIndex =0;//设置默认选择项索引
    Segmented.tintColor = [UIColor redColor];
    //是否保持选中状态
    Segmented.momentary = NO;
    
    
    [Segmented addTarget:self action:@selector(click:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:Segmented];
    
    Segmented.selectedSegmentIndex = 0;
    
    [self click:Segmented];

}
- (void)click: (id)sender{
    switch (Segmented.selectedSegmentIndex) {
        case 0:{
            [_secondview removeFromSuperview];
            [_thirdview removeFromSuperview];
            [self firstview];
            NSLog(@"1");
        }
            break;
        case 1:{
            [self.firstview removeFromSuperview];
            [self.thirdview removeFromSuperview];
            [self secondview];
            NSLog(@"2");
        }
            break;
        case 2:{
            [self.firstview removeFromSuperview];
            [self.secondview removeFromSuperview];
            [self thirdview];
            NSLog(@"3");
        }
            break;
        case 3:{
            [self.firstview removeFromSuperview];
            [self.secondview removeFromSuperview];
            [self.thirdview removeFromSuperview];
            NSLog(@"4");
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
