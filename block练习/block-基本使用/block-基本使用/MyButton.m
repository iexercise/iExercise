//
//  MyButton.m
//  block-基本使用
//
//  Created by lovepeijun on 16/5/26.
//  Copyright © 2016年 lovepeijun. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton
- (IBAction)clickChangeColor:(id)sender {
    
    if (_clickChangeColorButton) {
        _clickChangeColorButton();
    }
}


- (void)setClickChangeColorButton:(ClickChangeColorButton)clickChangeColorButton
{
    if (!_clickChangeColorButton) {
        _clickChangeColorButton = nil;
        _clickChangeColorButton = clickChangeColorButton;
    }
}

//int x = arc4random() % 255;
//int y = arc4random() % 255;
//int z = arc4random() % 255;
//
//[self setBackgroundColor:[UIColor colorWithRed:x/255.0 green:z/255.0 blue:y/255.0 alpha:1.0]];


@end
