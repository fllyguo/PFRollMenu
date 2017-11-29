//
//  BInputInfoTableViewCell.h
//  ZKDJ
//
//  Created by flyrees on 2017/11/14.
//

#import <UIKit/UIKit.h>
#import "BPressIndexModel.h"

@interface BInputInfoTableViewCell : UITableViewCell

@property(nonatomic,strong)UIPickerView* valuePickview;
@property (nonatomic, strong)BPressIndexModel *infoData;

//内容属性设置
@property (nonatomic, strong)UIColor *nameFontColor;//标题颜色
@property (nonatomic, assign)CGFloat nameFont;//标题字体大小
@property (nonatomic, strong)UIColor *descriptColor;//说明文字字体颜色
@property (nonatomic, assign)CGFloat descriptFont;//说明文字字体大小
@property (nonatomic, strong)UIColor *lineGroundColor;//横线颜色
@property (nonatomic, strong)UIColor *unitColor;//单位字体颜色
@property (nonatomic, assign)CGFloat unitFont;//单位字体大小

@end
