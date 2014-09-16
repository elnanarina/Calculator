//
//  AIView.h
//  Calculator
//
//  Created by Air on 14/8/14.
//  Copyright (c) 2014 Air. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIView : UIView

@property (nonatomic) UIButton *button1;
@property (nonatomic) UIButton *button2;
@property (nonatomic) UIButton *button3;
@property (nonatomic) UIButton *button4;
@property (nonatomic) UIButton *button5;
@property (nonatomic) UIButton *button6;
@property (nonatomic) UIButton *button7;
@property (nonatomic) UIButton *button8;
@property (nonatomic) UIButton *button9;
@property (nonatomic) UIButton *button0;
@property (nonatomic) UIButton *buttonPlus;
@property (nonatomic) UIButton *buttonMinus;
@property (nonatomic) UIButton *buttonMultiply;
@property (nonatomic) UIButton *buttonDivide;
@property (nonatomic) UIButton *buttonPoint;
@property (nonatomic) UIButton *buttonEqual;
@property (nonatomic) UIButton *buttonDel;
@property (nonatomic) UILabel *display;

@property (nonatomic) NSArray *buttonsNumbersList;
@property (nonatomic) NSArray *otherButtonsList;

@end
