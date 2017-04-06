//
//  ViewController.m
//  LcjPlateNumKeyboard
//
//  Created by liu on 2017/1/12.
//  Copyright © 2017年 lcj. All rights reserved.
//  test

#import "ViewController.h"
#import "PlateNumCollectionView.h"
#import "PlateNumModel.h"
#define Scale [UIScreen mainScreen].bounds.size.width / 320
/**<屏幕宽度*/
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width

/**<屏幕高度*/
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height

#define TextOriginTag 3300

@interface ViewController ()<UITextFieldDelegate>

@property(nonatomic,strong) PlateNumCollectionView *collectionView;/**<车牌键盘*/

@property(nonatomic,strong) UITextField *textField0;/**<车牌城市输入*/
@property(nonatomic,strong) UITextField *textField1;/**<车牌号码输入*/
@property(nonatomic,strong) UITextField *textField2;/**<车牌号码输入*/
@property(nonatomic,strong) UITextField *textField3;/**<车牌号码输入*/
@property(nonatomic,strong) UITextField *textField4;/**<车牌号码输入*/
@property(nonatomic,strong) UITextField *textField5;/**<车牌号码输入*/
@property(nonatomic,strong) UITextField *textField6;/**<车牌号码输入*/

@property(nonatomic,assign) NSInteger index;
@property(nonatomic,assign) PlateNumType numType;
@property(nonatomic,strong) NSArray<UITextField *> *textFieldArray;/**<textField数组*/
@property(nonatomic,strong) NSArray *keyBoardArray;/**<键盘数组*/

@property(nonatomic,copy) NSString *carNum;

@end

@implementation ViewController

#pragma mark - lifestyle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self crateUI];
}
#pragma mark - delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{

    self.index = textField.tag - TextOriginTag;
    PlateNumType originType = self.numType;
    if (textField.tag == TextOriginTag) {
        
        self.numType = PlateNumTypeProvince;
    }else{
    
        self.numType = PlateNumTypeNumber;
    }
    
    if (originType != self.numType) {
        
        if (textField.tag == TextOriginTag) {
            
            self.collectionView.collectionModel = ((PlateNumModel *)self.keyBoardArray[0]);
        }else{
            
            self.collectionView.collectionModel = ((PlateNumModel *)self.keyBoardArray[1]);
        }
    }
}
#pragma mark - private method

- (void)crateUI{
    
    [self.view addSubview:self.textField0];
    [self.view addSubview:self.textField1];
    [self.view addSubview:self.textField2];
    [self.view addSubview:self.textField3];
    [self.view addSubview:self.textField4];
    [self.view addSubview:self.textField5];
    [self.view addSubview:self.textField6];
    self.textField0.frame = CGRectMake(110, 160, 30, 35);
    self.textField1.frame = CGRectMake(141, 160, 30, 35);
    self.textField2.frame = CGRectMake(172, 160, 30, 35);
    self.textField3.frame = CGRectMake(203, 160, 30, 35);
    self.textField4.frame = CGRectMake(234, 160, 30, 35);
    self.textField5.frame = CGRectMake(265, 160, 30, 35);
    self.textField6.frame = CGRectMake(296, 160, 30, 35);
    self.textFieldArray = @[self.textField0,self.textField1,self.textField2,self.textField3,self.textField4,self.textField5,self.textField6];
}

- (NSInteger)forinArrFromIndex:(NSInteger)fromIndex toNext:(NSInteger )nextIndex str:(NSString *)str{
    
    if (fromIndex < 0 || fromIndex >= self.textFieldArray.count) {
        
        return -1;
    }else{
        
        self.textFieldArray[fromIndex].text = str;
    }
    self.carNum = [NSString stringWithFormat:@"%@%@%@%@%@%@%@",self.textField0.text,self.textField1.text,self.textField2.text,self.textField3.text,self.textField4.text,self.textField5.text,self.textField6.text];
    NSInteger k = 0;
    BOOL isHave = NO;
    for (NSInteger i = nextIndex; i < self.textFieldArray.count; i++) {
        if([self.textFieldArray[i] text].length == 0)
        {
            k = i;
            [self.textFieldArray[i] becomeFirstResponder];
            isHave = YES;
            break;
        };
    }
    if (!isHave) {
        for (NSInteger i = 0; i < self.textFieldArray.count; i++) {
            if([self.textFieldArray[i] text].length == 0)
            {
                k = i;
                [self.textFieldArray[i] becomeFirstResponder];
                isHave = YES;
                break;
            };
        }
    }
    if (!isHave) {
        [self.view endEditing:YES];
        return 7;
    }else
        return k;
}

- (NSInteger)forInArrFromIndex:(NSInteger)fromIndex toBefore:(NSInteger )beforeIndex str:(NSString *)str{
    
    if (fromIndex < 0 || fromIndex >= self.textFieldArray.count || beforeIndex < -1) {
        
        return -1;
    }
    NSInteger k = 0;
    BOOL isHave = NO;
    UITextField *seletField;
    for (NSInteger i = fromIndex; i >= 0; i--) {
        if([self.textFieldArray[i] text].length != 0)
        {
            k = i;
            seletField = self.textFieldArray[i];
            [self.textFieldArray[i] becomeFirstResponder];
            isHave = YES;
            break;
        };
    }
    if (!isHave) {
        for (NSInteger i = self.textFieldArray.count - 1; i >= 0 ; i--) {
            if([self.textFieldArray[i] text].length != 0)
            {
                k = i;
                [self.textFieldArray[i] becomeFirstResponder];
                isHave = YES;
                seletField = self.textFieldArray[i];
                break;
            };
        }
    }
    if (!isHave) {
        
        return -1;
    }else{
        
        seletField.text = str;
        self.carNum = [NSString stringWithFormat:@"%@%@%@%@%@%@%@",self.textField0.text,self.textField1.text,self.textField2.text,self.textField3.text,self.textField4.text,self.textField5.text,self.textField6.text];
        return k;
    }
}
#pragma mark - setter && getter
- (PlateNumCollectionView *)collectionView{

    if (!_collectionView) {
        _collectionView = [[PlateNumCollectionView alloc]initWithFrame:CGRectMake(0, 200, SCREEN_WIDTH, 35 * 4 * Scale + 10)];
        typeof(self) __weak weakSelf = self;
        _collectionView.provinceOrNum = ^(NSString *provinceType) {
            
            if (![provinceType isEqualToString:@"delete"]) {
                
                [weakSelf forinArrFromIndex:weakSelf.index toNext:weakSelf.index + 1 str:provinceType];
            }else{
                
                [weakSelf forInArrFromIndex:weakSelf.index toBefore:weakSelf.index - 1 str:@""];
            }
        };
    }
    return _collectionView;
}
- (NSArray *)textFieldArray{

    if (!_textFieldArray) {
        _textFieldArray = [NSArray array];
    }
    return _textFieldArray;
}
- (UITextField *)textField0{
    
    if (!_textField0) {
        
        _textField0 = [self createATextFieldTag:TextOriginTag + 0];
    }
    return _textField0;
}
- (UITextField *)textField1{
    
    if (!_textField1) {
        
        _textField1 = [self createATextFieldTag:TextOriginTag + 1];
    }
    return _textField1;
}

- (UITextField *)textField2{
    
    if (!_textField2) {
        _textField2 = [self createATextFieldTag:TextOriginTag + 2];
    }
    return _textField2;
}
- (UITextField *)textField3{
    
    if (!_textField3) {
        
        _textField3 = [self createATextFieldTag:TextOriginTag + 3];
    }
    return _textField3;
}
- (UITextField *)textField4{
    
    if (!_textField4) {
        
        _textField4 = [self createATextFieldTag:TextOriginTag + 4];
    }
    return _textField4;
}

- (UITextField *)textField5{
    
    if (!_textField5) {
        _textField5 = [self createATextFieldTag:TextOriginTag + 5];
    }
    return _textField5;
}
- (UITextField *)textField6{
    
    if (!_textField6) {
        _textField6 = [self createATextFieldTag:TextOriginTag + 6];
    }
    return _textField6;
}
- (UITextField *)createATextFieldTag:(NSUInteger)tag{

    UITextField *textField = [[UITextField alloc]init];
    textField.layer.borderColor = [UIColor redColor].CGColor;
    textField.layer.borderWidth= 1.0f;
    textField.inputView = self.collectionView;
    textField.delegate = self;
    textField.textAlignment = NSTextAlignmentCenter;
    textField.tag = tag;
    return textField;
}
- (NSArray *)keyBoardArray{
    
    if (!_keyBoardArray) {
        _keyBoardArray = [PlateNumModel allPlateNums];
    }
    return _keyBoardArray;
}
@end
