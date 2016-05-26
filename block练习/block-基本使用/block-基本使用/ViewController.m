//
//  ViewController.m
//  block-基本使用
//
//  Created by lovepeijun on 16/5/26.
//  Copyright © 2016年 lovepeijun. All rights reserved.
//


#import "ViewController.h"
#import "MyButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加myButton
    MyButton *myBtn = [[NSBundle mainBundle] loadNibNamed:@"MyButton" owner:nil options:nil].lastObject;
    myBtn.center = self.view.center;
    myBtn.bounds = CGRectMake(0, 0, 100, 100);
    [self.view addSubview:myBtn];
    
    myBtn.clickChangeColorButton = ^{
        int x = arc4random() % 255;
        int y = arc4random() % 255;
        int z = arc4random() % 255;
        
        [self.view setBackgroundColor:[UIColor colorWithRed:x/255.0 green:z/255.0 blue:y/255.0 alpha:1.0]];
    };
}




@end
