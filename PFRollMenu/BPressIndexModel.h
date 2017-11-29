//
//  BPressIndexModel.h
//  Romens.XSBalance
//
//  Created by 李美东 on 16/8/17.
//  Copyright © 2016年 孙博. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BPressIndexModel : NSObject<NSCopying>
@property(nonatomic,copy)NSString*key;
@property(nonatomic,copy)NSString*name;
@property(nonatomic,copy)NSString*value;
@property (nonatomic, strong)NSString *defaultValue;//pickerView 默认值
@property (nonatomic, strong)NSString *descript;//说明文字
@property(nonatomic,copy)NSString*unit;

@end
