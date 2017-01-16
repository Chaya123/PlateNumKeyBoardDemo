//
//  PlateNumCollectionView.m
//  LcjPlateNumKeyboard
//
//  Created by liu on 2017/1/12.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "PlateNumCollectionView.h"
#import "PlateNumCollectionCell.h"

#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width/**<屏幕宽度*/
#define Scale [UIScreen mainScreen].bounds.size.width / 320 /**<屏幕比例*/

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height /**<屏幕高度*/

@interface PlateNumCollectionView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong) UICollectionView *collectionView;


@end

@implementation PlateNumCollectionView


- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor lightGrayColor];
        [self loadUI];
    }
    return self;
}

- (void)loadUI{

//    [self addSubview:self.deleteButton];
//    self.deleteButton.frame = CGRectMake(SCREEN_WIDTH - 47, SCREEN_HEIGHT - 27, 45, 25);
//    //    [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
//    //        make.right.bottom.mas_equalTo(self).offset(-2);
//    //    make.width.mas_equalTo(45);
//    //    make.height.mas_equalTo(25);
//    //    }];
    
    [self addSubview:self.collectionView];
    self.collectionView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.frame.size.height);
    
//    [collection mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self);
//    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.collectionModel.plateNumArray.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    PlateNumCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PTCollectionViewCell" forIndexPath:indexPath];
    if (indexPath.row == self.collectionModel.plateNumArray.count) {

        cell.plateName = @"";
        
    }else{
        cell.plateName = self.collectionModel.plateNumArray[indexPath.row];
    }
    return cell;
}
#pragma mark UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == self.collectionModel.plateNumArray.count) {
        
        return CGSizeMake(29 * Scale, 29 * Scale + 6 * Scale);
    }else{
    
        return CGSizeMake(29 * Scale, 29 * Scale + 6 * Scale);
    }
}
#pragma mark UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *provinceStr = indexPath.row == self.collectionModel.plateNumArray.count ? @"delete":self.collectionModel.plateNumArray[indexPath.row];

    if (self.provinceOrNum) {
        self.provinceOrNum(provinceStr);
    }
}
- (void)setCollectionModel:(PlateNumModel *)collectionModel{

    _collectionModel = collectionModel;
    [self.collectionView reloadData];
}

- (UICollectionView *)collectionView{

    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 2;
        flowLayout.minimumInteritemSpacing = 2;
        flowLayout.sectionInset = UIEdgeInsetsMake(2,2,2,2);
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = FALSE;
        [_collectionView registerClass:[PlateNumCollectionCell class] forCellWithReuseIdentifier:@"PTCollectionViewCell"];
    }
    return _collectionView;
}

//- (UIButton *)deleteButton{
//
//    if (!_deleteButton) {
//        _deleteButton = [[UIButton alloc]init];
//        _deleteButton.backgroundColor = [UIColor redColor];
//        [_deleteButton setImage:[UIImage imageNamed:@"keyboard_btn_delete"] forState:UIControlStateNormal];
//        [_deleteButton addTarget:self action:@selector(deleteButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _deleteButton;
//}

@end
