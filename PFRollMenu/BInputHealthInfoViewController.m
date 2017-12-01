//
//  BInputHealthInfoViewController.m
//  ZKDJ
//
//  Created by flyrees on 2017/11/14.
//

#define kDefaultColor [UIColor colorWithWhite:0 alpha:.1]
#define kWhiteColor [UIColor whiteColor]
#define kBlackColor [UIColor blackColor]

#import "BInputHealthInfoViewController.h"
#import "BInputInfoTableViewCell.h"
#import "BPressIndexModel.h"

@interface BInputHealthInfoViewController ()<UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic, strong)UITableView *inputInfoTab;//输入信息tableView
@property (nonatomic, strong)UIButton *finishBut;//完成按钮
@property (nonatomic, strong)NSMutableArray *titleArr;//存放可选这范围数据
@property (nonatomic, assign)BOOL isDefaultInfo;//是否是默认信息

@end

@implementation BInputHealthInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setDefaultValue];//设置默认值
    self.view.backgroundColor = _backGroundColor;
    _isDefaultInfo = YES;
    
    
    [self.view addSubview:self.inputInfoTab];
    [self.view addSubview:self.finishBut];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_inputInfoTab]-10-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_inputInfoTab)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_finishBut]-10-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_finishBut)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_inputInfoTab]-10-[_finishBut(44)]-10-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_inputInfoTab, _finishBut)]];
}
- (UITableView *)inputInfoTab {
    if (!_inputInfoTab) {
        _inputInfoTab = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _inputInfoTab.translatesAutoresizingMaskIntoConstraints = NO;
        _inputInfoTab.backgroundColor = [UIColor clearColor];
        _inputInfoTab.separatorStyle = UITableViewCellSelectionStyleNone;
        _inputInfoTab.delegate = self;
        _inputInfoTab.dataSource = self;
        _inputInfoTab.showsVerticalScrollIndicator = NO;
        _inputInfoTab.rowHeight = 160;
        if (_isNoSlide == NO) {
            _inputInfoTab.scrollEnabled = NO;
        }else{
            _inputInfoTab.scrollEnabled = YES;
        }
    }
    return _inputInfoTab;
}
- (UIButton *)finishBut {
    if (!_finishBut) {
        _finishBut = [UIButton buttonWithType:UIButtonTypeCustom];
        _finishBut.translatesAutoresizingMaskIntoConstraints = NO;
        _finishBut.backgroundColor = _finishColor;
        _finishBut.layer.cornerRadius = _finishRadius;
        [_finishBut setTitle:@"完成" forState:UIControlStateNormal];
        [_finishBut setTitleColor:_finishFontColor forState:UIControlStateNormal];
        [_finishBut addTarget:self action:@selector(finishActionClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _finishBut;
}
#pragma mark ----- tableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.infoDataArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, _intervalDistance)];
    headerV.backgroundColor = _intervalGroundColor;
    return headerV;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BInputInfoTableViewCell *infoCell = [tableView dequeueReusableCellWithIdentifier:@"infoCellId"];
    if (!infoCell) {
        infoCell = [[BInputInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"infoCellId"];
    }
    infoCell.selectionStyle = UITableViewCellSelectionStyleNone;
    infoCell.valuePickview.delegate = self;
    infoCell.valuePickview.dataSource = self;
    BPressIndexModel *model = self.infoDataArr[indexPath.section];
    infoCell.infoData = model;
    
    //选中pickerView第几行
    CGFloat indexF = ([model.defaultValue floatValue] - _minValue) / _intervalValue;
    NSString *indexS = [NSString stringWithFormat:@"%.f", indexF];
    [infoCell.valuePickview selectRow:[indexS integerValue] inComponent:0 animated:NO];
    
    //设置属性
    infoCell.backgroundColor = _contentGrountColor;
    infoCell.nameFontColor = _nameFontColor;
    infoCell.nameFont = _nameFont;
    infoCell.descriptColor = _descriptColor;
    infoCell.descriptFont = _descriptFont;
    infoCell.lineGroundColor = _lineGroundColor;
    infoCell.unitColor = _unitColor;
    infoCell.unitFont = _unitFont;
    
    return infoCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark --- UIPickerView delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.titleArr.count;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 30;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.titleArr objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //将默认值设置为Value
    if (_isDefaultInfo == YES) {
        for (BPressIndexModel *model in _infoDataArr) {
            model.value = model.defaultValue;
        }
        _isDefaultInfo = NO;
    }
    
    //设置选择滑动选择值
    BInputInfoTableViewCell *cell = (BInputInfoTableViewCell *)pickerView.superview.superview;
    NSIndexPath *indexPath = [_inputInfoTab indexPathForCell:cell];
    NSString *string = [self.titleArr objectAtIndex:row];
    BPressIndexModel *model = [_infoDataArr objectAtIndex:indexPath.section];
    BPressIndexModel *newModel = [model copy];
    newModel.value = string;
    newModel.defaultValue = model.defaultValue;
    [_infoDataArr replaceObjectAtIndex:indexPath.section withObject:newModel];
}
#pragma mark ----- 完成按钮点击方法
- (void)finishActionClick:(UIButton *)sender {
    //不滑动pickerView、直接返回需要显示默认值
    if (_isDefaultInfo == YES) {
        for (BPressIndexModel *model in _infoDataArr) {
            model.value = model.defaultValue;
        }
    }
    if (self.finishInputInfoBlock) {
        self.finishInputInfoBlock(self.infoDataArr);
    }
}
#pragma mark --- 可选择数据
- (NSMutableArray *)titleArr {
    if (!_titleArr) {
        _titleArr = [NSMutableArray array];
        //设置默认最小值(默认为0)
        if (_minValue == 0) {
            _minValue = 0;
        }
        //设置默认最大值(默认为200)
        if (_maxValue == 0) {
            _maxValue = 200;
        }
        //设置默认两数之间相差值(默认为1)
        if (_intervalValue == 0) {
            _intervalValue = 1;
        }
        //设置默认小数位数(默认为整数)
        if (_decimalPlace == 0) {
            _decimalPlace = 0;
        }
        
        NSString *format = [NSString stringWithFormat:@"%%.%ldf",_decimalPlace];
        for (float i = _minValue; i < _maxValue;) {
            [_titleArr addObject:[NSString stringWithFormat:format, i]];
            i += _intervalValue;
        }
    }
    return _titleArr;
}
#pragma mark --- 设置默认值
- (void)setDefaultValue {
    //整体背景
    if (_backGroundColor == nil) {
        _backGroundColor = kWhiteColor;
    }
    //间隙
    if (_intervalGroundColor == nil) {
        _intervalGroundColor = kWhiteColor;
    }
    //间隙距离
    if (_intervalDistance == 0) {
        _intervalDistance = 10;
    }
    //按钮
    if (_finishColor == nil) {
        _finishColor = kDefaultColor;
    }
    //按钮字体颜色
    if (_finishFontColor == nil) {
        _finishFontColor = kBlackColor;
    }
    //按钮圆角
    if (_finishRadius == 0) {
        _finishRadius = 3.0f;
    }
    /************ 内容属性设置 ************/
    //内容背景
    if (_contentGrountColor == nil) {
        _contentGrountColor = kDefaultColor;
    }
    //标题字体颜色
    if (_nameFontColor == nil) {
        _nameFontColor = kBlackColor;
    }
    //标题字体大小
    if (_nameFont == 0) {
        _nameFont = 18.0f;
    }
    //说明文字字体颜色
    if (_descriptColor == nil) {
        _descriptColor = [UIColor lightGrayColor];
    }
    //说明文字字体大小
    if (_descriptFont == 0) {
        _descriptFont = 15.0f;
    }
    //横线颜色
    if (_lineGroundColor == nil) {
        _lineGroundColor = [UIColor colorWithRed:0.667 green:0.667 blue:0.667 alpha:0.3];
    }
    //单位字体颜色
    if (_unitColor == nil) {
        _unitColor = kBlackColor;
    }
    //单位字体大小
    if (_unitFont == 0) {
        _unitFont = 18.0f;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
