//
//  PlateNumCollectionCell.m
//  LcjPlateNumKeyboard
//
//  Created by liu on 2017/1/12.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "PlateNumCollectionCell.h"

@interface PlateNumCollectionCell()

@property(nonatomic,strong) UILabel *plateNameLabel;
@property(nonatomic,strong) UIImageView *deleteImageView;

@end

@implementation PlateNumCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.layer.cornerRadius = 3;
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
        [self loadUI];
    }
    return self;
}
- (void)loadUI
{
    [self.contentView addSubview:self.plateNameLabel];
    [self.contentView addSubview:self.deleteImageView];
    self.plateNameLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.deleteImageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//    [self.plateNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self);
//    }];
//    [self.deleteImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self);
//    }];
}

- (void)setPlateName:(NSString *)plateName{

    _plateName = plateName;
    self.deleteImageView.hidden = plateName.length > 0 ? YES : NO;
    self.plateNameLabel.text = plateName;
}

- (UILabel *)plateNameLabel{

    if (!_plateNameLabel) {
        
        _plateNameLabel = [[UILabel alloc]init];
        _plateNameLabel.textAlignment = NSTextAlignmentCenter;
        _plateNameLabel.font = [UIFont systemFontOfSize:13];
        _plateNameLabel.textColor = [UIColor blackColor];
    }
    return _plateNameLabel;
}

- (UIImageView *)deleteImageView{

    if (!_deleteImageView) {
        
        _deleteImageView = [[UIImageView alloc]init];
        _deleteImageView.image = [UIImage imageNamed:@"keyboard_btn_delete"];
        _deleteImageView.hidden = YES;
    }
    return _deleteImageView;
}

@end
