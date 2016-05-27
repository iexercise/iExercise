//
//  ViewController.m
//  block-基本使用
//
//  Created by lovepeijun on 16/5/26.
//  Copyright © 2016年 lovepeijun. All rights reserved.
//


#import "ViewController.h"
#import "MyButton.h"
#import <Masonry.h>

@interface ViewController ()<UITextFieldDelegate, UIGestureRecognizerDelegate>
/** textfiled */
@property(nonatomic, weak)UITextField *inputextF;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加myButton
    MyButton *myBtn = [[NSBundle mainBundle] loadNibNamed:@"MyButton" owner:nil options:nil].lastObject;
    myBtn.center = self.view.center;
    
    
    [self.view addSubview:myBtn];
    
    
    /*-----------------------案例一(无论何时View都居中)------------------------*/
    //防止block循环引用
    __weak typeof(self) weakSelf = self;
    [myBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        //约束大小
        make.size.mas_equalTo(CGSizeMake(100, 100));
        //约束位置
        make.center.mas_equalTo(weakSelf.view);
    }];
//    myBtn.bounds = CGRectMake(0, 0, 100, 100);
    
    myBtn.clickChangeColorButton = ^{
        int x = arc4random() % 255;
        int y = arc4random() % 255;
        int z = arc4random() % 255;
        
        [self.view setBackgroundColor:[UIColor colorWithRed:x/255.0 green:z/255.0 blue:y/255.0 alpha:1.0]];
    };
    
    
    /*-----------------------案例二(两个View宽度,高度一样,除去margin平分屏幕宽度)------------------------*/
    UIView *blackView = [[UIView alloc] init];
    blackView.backgroundColor = [UIColor blackColor];
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    
    //添加到父类视图中
    [self.view addSubview:blackView];
    [self.view addSubview:redView];
    
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(0.5*(self.view.bounds.size.width-3*5));
        make.height.mas_equalTo(@50);
        make.left.mas_equalTo(self.view).offset(5);
        make.centerY.mas_equalTo(self.view).offset(100);
    }];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(blackView);
        make.top.mas_equalTo(blackView);
        make.right.mas_equalTo(weakSelf.view).offset(-5);
    }];
    
    
    /*-----------------------案例三(当键盘挡住输入框时，输入框自动向上弹到键盘上方)------------------------*/
    UITextField *inputextF = [[UITextField alloc] init];
    inputextF.placeholder = @"键入文字";
    inputextF.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:inputextF];
    self.inputextF = inputextF;
    inputextF.delegate = self;
    
    [inputextF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 50));
        make.center.mas_equalTo(weakSelf.view).offset(-100);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(endEditing)];
    [self.view addGestureRecognizer:tap];
    
    
}

- (void)endEditing
{
    [self.inputextF endEditing:YES];
}


#pragma mark - UITextFieldDelegate
#pragma mark -----------------------------------
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    //防止block循环引用
    __weak typeof(self) weakSelf = self;
    
    [textField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.view).offset(-150);
    }];
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded]; }];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    //防止block循环引用
    __weak typeof(self) weakSelf = self;
    
    [textField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.view).offset(-100);
    }];
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded]; }];
}

#pragma mark - UIGestureRecognizerDelegate
#pragma mark -----------------------------------





@end
