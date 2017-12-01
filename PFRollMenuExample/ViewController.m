//
//  ViewController.m
//  PFRollMenuExample
//
//  Created by flyrees on 2017/11/29.
//  Copyright © 2017年 flyrees. All rights reserved.
// 欢迎访问简书：http://www.jianshu.com/u/77bbcf25cb53

#import "ViewController.h"
#import "BPressIndexModel.h"
#import "BInputHealthInfoViewController.h"

@interface ViewController ()
@property (nonatomic, strong)NSMutableArray *dataArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"点这里" style:UIBarButtonItemStylePlain target:self action:@selector(click)];
}
- (void)click
{
    BInputHealthInfoViewController *infoVc = [[BInputHealthInfoViewController alloc] init];
    infoVc.minValue = 0;
    infoVc.maxValue = 200;
    infoVc.intervalValue = 1;
    infoVc.decimalPlace = 0;
    infoVc.isNoSlide = YES;
    for (BPressIndexModel *model in self.dataArray) {
        NSLog(@"选择之前：选择之前的值：%@    选择之前的默认值：=====%@", model.value, model.defaultValue);
    }
    infoVc.infoDataArr = self.dataArray;
    __weak BInputHealthInfoViewController * N_BInputInfoVC= infoVc;
    infoVc.finishInputInfoBlock = ^(NSMutableArray *array) {
        for (BPressIndexModel *model in array) {
            NSLog(@"选择之后：选择的值：%@---默认的值：%@\n", model.value, model.defaultValue);
        }
        [N_BInputInfoVC.navigationController popViewControllerAnimated:YES];
    };
    [self.navigationController pushViewController:infoVc animated:YES];
}
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        BPressIndexModel * model=[[BPressIndexModel alloc]init];
        model.key=@"123";
        model.name=@"收缩压";
        model.value=@"----";
        model.unit=@"bpm";
        model.descript = @"输入其他测量设备测量的血压结果中的";
        model.defaultValue = @"120";
        [_dataArray addObject:model];
        
        model=[[BPressIndexModel alloc]init];
        model.key=@"321";
        model.name=@"舒张压";
        model.value=@"----";
        model.unit=@"bpm";
        model.descript = @"输入其他测量设备测量的血压结果中的";
        model.defaultValue = @"80";
        [_dataArray addObject:model];
        
        model=[[BPressIndexModel alloc]init];
        model.key=@"345";
        model.name=@"心率";
        model.value=@"----";
        model.unit=@"bmp";
        model.defaultValue = @"75";
        model.descript = @"输入其他测量设备测量的血压结果中的";
        [_dataArray addObject:model];
    }
    return _dataArray;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
