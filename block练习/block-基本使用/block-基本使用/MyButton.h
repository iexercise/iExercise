//
//  MyButton.h
//  block-基本使用
//
//  Created by lovepeijun on 16/5/26.
//  Copyright © 2016年 lovepeijun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickChangeColorButton)();
typedef void(^ChageButtonTitle)(NSString *);

@interface MyButton : UIView
@property (nonatomic, copy) ClickChangeColorButton clickChangeColorButton;
@end
