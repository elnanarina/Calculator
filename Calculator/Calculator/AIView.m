//
//  AIView.m
//  Calculator
//
//  Created by Air on 14/8/14.
//  Copyright (c) 2014 Air. All rights reserved.
//

#import "AIView.h"

@implementation AIView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _display = [UILabel new];
        
        _button1 = [UIButton new];
        _button2 = [UIButton new];
        _button3 = [UIButton new];
        _button4 = [UIButton new];
        _button5 = [UIButton new];
        _button6 = [UIButton new];
        _button7 = [UIButton new];
        _button8 = [UIButton new];
        _button9 = [UIButton new];
        _button0 = [UIButton new];
        _buttonDivide = [UIButton new];
        _buttonEqual = [UIButton new];
        _buttonMinus = [UIButton new];
        _buttonMultiply = [UIButton new];
        _buttonPlus = [UIButton new];
        _buttonPoint = [UIButton new];
        _buttonDel = [UIButton new];
        
        _buttonsNumbersList = [[NSArray alloc] initWithObjects:_button0, _button1, _button2, _button3, _button4, _button5, _button6, _button7, _button8, _button9, nil];
        _otherButtonsList = [[NSArray alloc] initWithObjects: _buttonPoint, _buttonEqual, _buttonPlus, _buttonMinus, _buttonMultiply, _buttonDivide, _buttonDel, nil];
        NSArray *operations = [[NSArray alloc] initWithObjects:@".", @"=", @"+", @"-", @"*", @"/", @"C", nil];
        int i = 0;
        NSString *number;

        for ( UIButton *button in _buttonsNumbersList ) {
            button.backgroundColor = [UIColor whiteColor];
            number = [[NSString alloc] initWithFormat:@"%i", i];
            [button setTitle:number forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            button.tag = i;
            i += 1;
            [self addSubview:button];
        }
        
        int index = 0;
        for ( UIButton *button in _otherButtonsList ) {
            button.backgroundColor = [UIColor greenColor];
            [button setTitle:operations[index] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            index += 1;
            [self addSubview:button];
        }
        _display.backgroundColor = [UIColor whiteColor];
        _display.text = @"0";
        [self addSubview:_display];
    }
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    _display.frame = CGRectMake(15, screenRect.size.height * 0.125, 285, 70);
    
    _button1.frame = CGRectMake(15, screenRect.size.height * 0.3333, 70, 70);
    _button2.frame = CGRectMake(95, screenRect.size.height * 0.3333, 70, 70);
    _button3.frame = CGRectMake(175, screenRect.size.height * 0.3333, 70, 70);
    _button4.frame = CGRectMake(15, screenRect.size.height * 0.5, 70, 70);
    _button5.frame = CGRectMake(95, screenRect.size.height * 0.5, 70, 70);
    _button6.frame = CGRectMake(175, screenRect.size.height * 0.5, 70, 70);
    _button7.frame = CGRectMake(15, screenRect.size.height * 0.6667, 70, 70);
    _button8.frame = CGRectMake(95, screenRect.size.height * 0.6667, 70, 70);
    _button9.frame = CGRectMake(175, screenRect.size.height * 0.6667, 70, 70);
    _button0.frame = CGRectMake(15, screenRect.size.height * 0.8333, 70, 70);
    _buttonPoint.frame = CGRectMake(95, screenRect.size.height * 0.8333, 70, 70);
    _buttonDel.frame = CGRectMake(175, screenRect.size.height * 0.8333, 70, 70);
    
    _buttonPlus.frame = CGRectMake(255, screenRect.size.height * 0.3333, 50, 50);
    _buttonMinus.frame = CGRectMake(255, screenRect.size.height * 0.4583, 50, 50);
    _buttonMultiply.frame = CGRectMake(255, screenRect.size.height * 0.5833, 50, 50);
    _buttonDivide.frame = CGRectMake(255, screenRect.size.height * 0.7083, 50, 50);
    _buttonEqual.frame = CGRectMake(255, screenRect.size.height * 0.8333, 50, 70);
    
    for ( UIButton *button in _buttonsNumbersList ) {
        button.layer.cornerRadius = button.bounds.size.width / 2.0;
    }
    for ( UIButton *button in _otherButtonsList ) {
        button.layer.cornerRadius = 20.0;
    }
    
    return self;
}

@end
