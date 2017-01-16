//
//  PlateNumCollectionView.h
//  LcjPlateNumKeyboard
//
//  Created by liu on 2017/1/12.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlateNumModel.h"

typedef void(^PlateNumClick)(NSString *provinceType);

typedef void(^DeleteButtonClick)(void);

@interface PlateNumCollectionView : UIView

@property(nonatomic,copy) DeleteButtonClick deleteClick;/**<删除*/
@property(nonatomic,copy) PlateNumClick provinceOrNum;/**<选中车牌号*/
@property(nonatomic,strong) PlateNumModel *collectionModel;/**<内容*/

@end
