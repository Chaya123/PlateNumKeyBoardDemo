//
//  PlateNumModel.h
//  PlateNumberKeyBoard
//
//  Created by liu on 2017/1/12.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger,PlateNumType) {

    PlateNumTypeProvince = 1,/**<车牌省份*/
    PlateNumTypeNumber,/**<车牌号码*/
};
@interface PlateNumModel : NSObject

@property(nonatomic,assign) PlateNumType plateNumType;/**<车牌类型*/

@property(nonatomic,copy) NSString *title;/**<键盘上显示的标题*/

@property(nonatomic,strong) NSArray *plateNumArray;/**<键盘上显示的内容Array*/

@end


/**
 得到车牌的相关数据
 */
@interface PlateNumModel (Create)

+ (PlateNumModel *)provinceArrayModel;
+ (PlateNumModel *)plateNumArrayModel;
//得到所有车的数据
+ (NSArray *)allPlateNums;

@end
