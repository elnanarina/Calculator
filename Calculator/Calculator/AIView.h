//
//  AIView.h
//  Calculator
//
//  Created by Air on 14/8/14.
//  Copyright (c) 2014 Air. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIView : UIView

@property (nonatomic) UIButton *buttonPlus;
@property (nonatomic) UIButton *buttonMinus;
@property (nonatomic) UIButton *buttonMultiply;
@property (nonatomic) UIButton *buttonDivide;
@property (nonatomic) UIButton *buttonPoint;
@property (nonatomic) UIButton *buttonEqual;
@property (nonatomic) UIButton *buttonDel;
@property (nonatomic) UILabel  *display;

@property (nonatomic) NSMutableArray *digitalButtonsList;
@property (nonatomic) NSArray *actionButtonsList;

@end
