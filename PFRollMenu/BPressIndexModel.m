//
//  BPressIndexModel.m
//  Romens.XSBalance
//
//  Created by 李美东 on 16/8/17.
//  Copyright © 2016年 孙博. All rights reserved.
// 

#import "BPressIndexModel.h"

@implementation BPressIndexModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

- (id)copyWithZone:(NSZone *)zone
{
    BPressIndexModel * copy =  [[[self class] allocWithZone:zone] init];
    copy->_name=[self.name mutableCopy];
    copy->_key=[self.key mutableCopy];
    copy->_value=[self.value mutableCopy];
    copy->_unit=[self.unit mutableCopy];
    copy->_descript = [self.descript mutableCopy];
    return copy;
}

@end
