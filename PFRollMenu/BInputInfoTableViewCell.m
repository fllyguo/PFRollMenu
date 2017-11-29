//
//  BInputInfoTableViewCell.m
//  ZKDJ
//
//  Created by flyrees on 2017/11/14.
//.m文件为什么。。。

#import "BInputInfoTableViewCell.h"

@interface BInputInfoTableViewCell()
@property(nonatomic,strong)UILabel*nameLabel;
@property(nonatomic,strong)UILabel*descriptLabel;
@property(nonatomic,strong)UILabel*unitLabel;
@property (nonatomic, strong)UIView *lineV;

@end

@implementation BInputInfoTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.unitLabel];
        [self.contentView addSubview:self.descriptLabel];
        [self.contentView addSubview:self.lineV];
        [self.contentView addSubview:self.valuePickview];
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_nameLabel]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_nameLabel)]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_descriptLabel]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_descriptLabel)]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_lineV]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_lineV)]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_nameLabel(30)][_descriptLabel(25)][_lineV(1)][_valuePickview(104)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_nameLabel,_descriptLabel,_lineV,_valuePickview)]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_valuePickview][_unitLabel(_valuePickview)]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_valuePickview,_unitLabel)]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_unitLabel(35)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_unitLabel)]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_unitLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_valuePickview attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];
    }
    return self;
}
- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel=[[UILabel alloc]init];
        _nameLabel.translatesAutoresizingMaskIntoConstraints=NO;
    }
    return _nameLabel;
}
- (UILabel *)unitLabel {
    if (!_unitLabel) {
        _unitLabel=[[UILabel alloc]init];
        _unitLabel.translatesAutoresizingMaskIntoConstraints=NO;
        _unitLabel.textAlignment=NSTextAlignmentCenter;
    }
    return _unitLabel;
}
- (UILabel *)descriptLabel {
    if (!_descriptLabel) {
        _descriptLabel=[[UILabel alloc]init];
        _descriptLabel.translatesAutoresizingMaskIntoConstraints=NO;
    }
    return _descriptLabel;
}
- (UIView *)lineV {
    if (!_lineV) {
        _lineV = [[UIView alloc] init];
        _lineV.translatesAutoresizingMaskIntoConstraints=NO;
    }
    return _lineV;
}
- (UIPickerView *)valuePickview {
    if (!_valuePickview) {
        _valuePickview=[[UIPickerView alloc]init];
        _valuePickview.translatesAutoresizingMaskIntoConstraints=NO;
    }
    return _valuePickview;
}
- (void)setInfoData:(BPressIndexModel *)infoData
{
    _nameLabel.text = infoData.name;
    _descriptLabel.text = [NSString stringWithFormat:@"%@%@值", infoData.descript,infoData.name];
    _unitLabel.text = infoData.unit;
}
- (void)setNameFontColor:(UIColor *)nameFontColor {
    [_nameLabel setTextColor:nameFontColor];
}
- (void)setNameFont:(CGFloat)nameFont {
    _nameLabel.font = [UIFont systemFontOfSize:nameFont];
}
- (void)setDescriptColor:(UIColor *)descriptColor {
    [_descriptLabel setTextColor:descriptColor];
}
- (void)setDescriptFont:(CGFloat)descriptFont {
    _descriptLabel.font=[UIFont systemFontOfSize:descriptFont];
}
- (void)setUnitColor:(UIColor *)unitColor {
    [_unitLabel setTextColor:unitColor];
}
- (void)setUnitFont:(CGFloat)unitFont {
    _unitLabel.font= [UIFont systemFontOfSize:unitFont];
}
- (void)setLineGroundColor:(UIColor *)lineGroundColor {
    _lineV.backgroundColor = lineGroundColor;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
