//
//  BInputHealthInfoViewController.h
//  ZKDJ
//
//  Created by flyrees on 2017/11/14.
//

// 血糖、血压信息
#import "BInputHealthInfoViewController.h"
#import <UIKit/UIKit.h>

typedef void (^FinishInputInfoBlock)(NSMutableArray *);

@interface BInputHealthInfoViewController : UIViewController

@property (nonatomic, strong)NSMutableArray *infoDataArr;//数据数组
@property (nonatomic, assign)CGFloat minValue;//可选择最小值(默认为0)
@property (nonatomic, assign)CGFloat maxValue;//可选择最大值(默认为200)
@property (nonatomic, assign)CGFloat intervalValue;//俩值相隔多大(默认为1)
@property (nonatomic, assign)NSInteger decimalPlace;//保留几位小数(默认为整数)

#pragma mark --------- 界面展示属性
//整体设置
@property (nonatomic, strong)UIColor *backGroundColor;//整体背景颜色（默认为白色）
@property (nonatomic, strong)UIColor *intervalGroundColor;//间隙颜色（默认为白色）
@property (nonatomic, assign)CGFloat intervalDistance;//间隙大小(默认10)
@property (nonatomic, strong)UIColor *finishColor;//按钮颜色
@property (nonatomic, strong)UIColor *finishFontColor;//按钮字体颜色（默认黑色）
@property (nonatomic, assign)CGFloat finishRadius;//按钮圆角大小（默认为3.0f）
@property (nonatomic, assign)BOOL isNoSlide;//内容是否可以滚动(默认不可以滚动)
//内容设置
@property (nonatomic, strong)UIColor *contentGrountColor;//内容整体背景
@property (nonatomic, strong)UIColor *nameFontColor;//标题颜色
@property (nonatomic, assign)CGFloat nameFont;//标题字体大小（默认 18.0f）
@property (nonatomic, strong)UIColor *descriptColor;//说明文字字体颜色
@property (nonatomic, assign)CGFloat descriptFont;//说明文字字体大小（默认 15.0f）
@property (nonatomic, strong)UIColor *lineGroundColor;//横线颜色
@property (nonatomic, strong)UIColor *unitColor;//单位字体颜色
@property (nonatomic, assign)CGFloat unitFont;//单位字体大小（默认18.0f）

@property (nonatomic, copy)FinishInputInfoBlock finishInputInfoBlock;

@end
