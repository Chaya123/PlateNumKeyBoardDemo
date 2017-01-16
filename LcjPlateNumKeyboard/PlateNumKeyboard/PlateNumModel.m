//
//  PlateNumModel.m
//  PlateNumberKeyBoard
//
//  Created by liu on 2017/1/12.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "PlateNumModel.h"

@implementation PlateNumModel

@end

@implementation PlateNumModel (Create)

+ (NSDictionary *)plateNums{
    static NSDictionary *__plateNums = nil;
    if (!__plateNums){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"plateNum" ofType:@"json"];
        NSData *plateData = [[NSData alloc] initWithContentsOfFile:path];
        __plateNums = [NSJSONSerialization JSONObjectWithData:plateData options:NSJSONReadingAllowFragments error:nil];
    }
    return __plateNums;
}
//得到省份数据
+ (instancetype)provinceType{
    
    PlateNumModel *plateNumModel = [[PlateNumModel alloc]init];
    plateNumModel.title = @"省";
    plateNumModel.plateNumArray = [self plateNums][@"province"];
    plateNumModel.plateNumType = PlateNumTypeProvince;
    return plateNumModel;
}
//得到数字数据
+ (instancetype)numType{
    
    PlateNumModel *plateNumModel = [[PlateNumModel alloc]init];
    plateNumModel.title = @"车牌";
    plateNumModel.plateNumArray = [self plateNums][@"number"];
    plateNumModel.plateNumType = PlateNumTypeNumber;
    return plateNumModel;
}
//得到所有车的数据
+ (NSArray *)allPlateNums{
    
    return @[[self provinceType], [self numType]];
}
+ (PlateNumModel *)provinceArrayModel{

  return [self provinceType];
}
+ (PlateNumModel *)plateNumArrayModel{

    return [self numType];
}
@end
