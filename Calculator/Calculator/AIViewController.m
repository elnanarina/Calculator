//
//  ViewController.m
//  Calculator
//
//  Created by Air on 14/8/14.
//  Copyright (c) 2014 Air. All rights reserved.
//

#import "AIViewController.h"

@implementation AIViewController

- (void)loadView {
    _calculatorView = [AIView new];
    self.view = _calculatorView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _number = [[NSMutableString alloc] init];
    _memory = [[NSMutableString alloc] init];
    _operand = @"+";
    _formatter = [[NSNumberFormatter alloc] init];
    [_formatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [_formatter setGeneratesDecimalNumbers:YES];
    
    [_calculatorView.button0 addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorView.button1 addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorView.button2 addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorView.button3 addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorView.button4 addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorView.button5 addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorView.button6 addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorView.button7 addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorView.button8 addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorView.button9 addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorView.buttonDel addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorView.buttonPoint addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorView.buttonPlus addTarget:self action:@selector(actionPressButton:)
                         forControlEvents:UIControlEventTouchUpInside];
    [_calculatorView.buttonMinus addTarget:self action:@selector(actionPressButton:)
                          forControlEvents:UIControlEventTouchUpInside];
    [_calculatorView.buttonMultiply addTarget:self action:@selector(actionPressButton:)
                          forControlEvents:UIControlEventTouchUpInside];
    [_calculatorView.buttonDivide addTarget:self action:@selector(actionPressButton:)
                             forControlEvents:UIControlEventTouchUpInside];
    [_calculatorView.buttonEqual addTarget:self action:@selector(actionPressButton:)
                          forControlEvents:UIControlEventTouchUpInside];
}

- (void)pressButton:(UIButton*)sender {
    NSRange range = [_number rangeOfString:@"."];
    if ( sender == _calculatorView.buttonDel ) {
        [_number setString:@""];
        _calculatorView.display.text = @"0";
    } else if ( sender == _calculatorView.buttonPoint ) {
        if (  range.location == NSNotFound ) {
            [_number appendString:@"."];
            _calculatorView.display.text = _number;
        }
    } else if ( sender != _calculatorView.buttonDel ) {
        NSString *displayString = [[NSString alloc] initWithFormat:@"%i", sender.tag];
        [_number appendString:displayString];
        _calculatorView.display.text = _number;
    }
}

- (void)actionPressButton:(UIButton*)sender {
    if ( sender == _calculatorView.buttonPlus ) {
        [_memory setString:_number];
        [_number setString:@""];
        _operand = @"+";
    } else if ( sender == _calculatorView.buttonMinus ) {
        [_memory setString:_number];
        [_number setString:@""];
        _operand = @"-";
    } else if ( sender == _calculatorView.buttonMultiply ) {
        [_memory setString:_number];
        [_number setString:@""];
        _operand = @"*";
    } else if ( sender == _calculatorView.buttonDivide ) {
        [_memory setString:_number];
        [_number setString:@""];
        _operand = @"/";
    } else if ( sender == _calculatorView.buttonEqual ) {
        _firstDecimalNumber = (NSDecimalNumber*)[_formatter numberFromString:_memory];
        _lastDecimalNumber = (NSDecimalNumber*)[_formatter numberFromString:_number];
        
        if ( [_operand isEqualToString:@"+"] ) {
            _firstDecimalNumber = [_firstDecimalNumber decimalNumberByAdding:_lastDecimalNumber];
            _result = _firstDecimalNumber.stringValue;
            [_number setString:_result];
            [_memory setString:@""];
            _calculatorView.display.text = _result;
        }
        if ( [_operand isEqualToString:@"-"] ) {
            _firstDecimalNumber = [_firstDecimalNumber decimalNumberBySubtracting:_lastDecimalNumber];
            _result = _firstDecimalNumber.stringValue;
            [_number setString:_result];
            [_memory setString:@""];
            _calculatorView.display.text = _result;
        }
        if ( [_operand isEqualToString:@"*"] ) {
            _firstDecimalNumber = [_firstDecimalNumber decimalNumberByMultiplyingBy:_lastDecimalNumber];
            _result = _firstDecimalNumber.stringValue;
            [_number setString:_result];
            [_memory setString:@""];
            _calculatorView.display.text = _result;
        }
        if ( [_operand isEqualToString:@"/"] ) {
            NSNumber *zero = [[NSNumber alloc] initWithInt:0];
            if ( [_lastDecimalNumber isEqualToNumber:zero ] ) {
                _calculatorView.display.text = @"Divide by zero";
                [_number setString:@""];
            } else {
                _firstDecimalNumber = [_firstDecimalNumber decimalNumberByDividingBy:_lastDecimalNumber];
                _result = _firstDecimalNumber.stringValue;
                [_number setString:_result];
                [_memory setString:@""];
                _calculatorView.display.text = _result;
            }
        }
    }
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    if ( toInterfaceOrientation == UIInterfaceOrientationPortrait || toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown ) {
        CGRect screenRect = [[UIScreen mainScreen] bounds];

        _calculatorView.display.frame = CGRectMake(15, screenRect.size.height * 0.125, 285, 70);
        
        _calculatorView.button1.frame = CGRectMake(15, screenRect.size.height * 0.3333, 70, 70);
        _calculatorView.button2.frame = CGRectMake(95, screenRect.size.height * 0.3333, 70, 70);
        _calculatorView.button3.frame = CGRectMake(175, screenRect.size.height * 0.3333, 70, 70);
        _calculatorView.button4.frame = CGRectMake(15, screenRect.size.height * 0.5, 70, 70);
        _calculatorView.button5.frame = CGRectMake(95, screenRect.size.height * 0.5, 70, 70);
        _calculatorView.button6.frame = CGRectMake(175, screenRect.size.height * 0.5, 70, 70);
        _calculatorView.button7.frame = CGRectMake(15, screenRect.size.height * 0.6667, 70, 70);
        _calculatorView.button8.frame = CGRectMake(95, screenRect.size.height * 0.6667, 70, 70);
        _calculatorView.button9.frame = CGRectMake(175, screenRect.size.height * 0.6667, 70, 70);
        _calculatorView.button0.frame = CGRectMake(15, screenRect.size.height * 0.8333, 70, 70);
        _calculatorView.buttonPoint.frame = CGRectMake(95, screenRect.size.height * 0.8333, 70, 70);
        _calculatorView.buttonDel.frame = CGRectMake(175, screenRect.size.height * 0.8333, 70, 70);
        
        _calculatorView.buttonPlus.frame = CGRectMake(255, screenRect.size.height * 0.3333, 50, 50);
        _calculatorView.buttonMinus.frame = CGRectMake(255, screenRect.size.height * 0.4583, 50, 50);
        _calculatorView.buttonMultiply.frame = CGRectMake(255, screenRect.size.height * 0.5833, 50, 50);
        _calculatorView.buttonDivide.frame = CGRectMake(255, screenRect.size.height * 0.7083, 50, 50);
        _calculatorView.buttonEqual.frame = CGRectMake(255, screenRect.size.height * 0.8333, 50, 70);
        
        for ( UIButton *button in _calculatorView.buttonsNumbersList ) {
            button.layer.cornerRadius = button.bounds.size.width / 2.0;
        }
        for ( UIButton *button in _calculatorView.otherButtonsList ) {
            button.layer.cornerRadius = 20.0;
        }
        self.view.backgroundColor = [UIColor colorWithRed:1 green:0.527 blue:0.973 alpha:1.0];
    } else {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"15.jpg"]]];
        
        _calculatorView.display.frame = CGRectMake(screenRect.size.height * 0.025, 30, screenRect.size.height * 0.95, 40);
        
        _calculatorView.button1.frame = CGRectMake(screenRect.size.height * 0.025, 85, 70, 70);
        _calculatorView.button2.frame = CGRectMake(screenRect.size.height * 0.1979, 85, 70, 70);
        _calculatorView.button3.frame = CGRectMake(screenRect.size.height * 0.3646, 85, 70, 70);
        _calculatorView.button4.frame = CGRectMake(screenRect.size.height * 0.025, 165, 70, 70);
        _calculatorView.button5.frame = CGRectMake(screenRect.size.height * 0.1979, 165, 70, 70);
        _calculatorView.button6.frame = CGRectMake(screenRect.size.height * 0.3646, 165, 70, 70);
        _calculatorView.button7.frame = CGRectMake(screenRect.size.height * 0.025, 245, 70, 70);
        _calculatorView.button8.frame = CGRectMake(screenRect.size.height * 0.1979, 245, 70, 70);
        _calculatorView.button9.frame = CGRectMake(screenRect.size.height * 0.3646, 245, 70, 70);
        _calculatorView.button0.frame = CGRectMake(screenRect.size.height * 0.5521, 85, 70, 70);
        _calculatorView.buttonPoint.frame = CGRectMake(screenRect.size.height * 0.5521, 165, 70, 70);
        _calculatorView.buttonDel.frame = CGRectMake(screenRect.size.height * 0.5521, 245, 70, 70);
        
        _calculatorView.buttonPlus.frame = CGRectMake(screenRect.size.height * 0.7396, 85, 50, 50);
        _calculatorView.buttonMinus.frame = CGRectMake(screenRect.size.height * 0.8646, 85, 50, 50);
        _calculatorView.buttonMultiply.frame = CGRectMake(screenRect.size.height * 0.7396, 165, 50, 50);
        _calculatorView.buttonDivide.frame = CGRectMake(screenRect.size.height * 0.8646, 165, 50, 50);
        if ( screenRect.size.height == 480 ) {
            _calculatorView.buttonEqual.frame = CGRectMake(screenRect.size.height * 0.7396, 245, screenRect.size.height * 0.0208 + 100, 70);
        } else {
            _calculatorView.buttonEqual.frame = CGRectMake(screenRect.size.height * 0.7396, 245, screenRect.size.height * 0.0416 + 100, 70);
        }
        
        for ( UIButton *button in _calculatorView.buttonsNumbersList ) {
            button.layer.cornerRadius = button.bounds.size.width / 2.0;
        }
        for ( UIButton *button in _calculatorView.otherButtonsList ) {
            button.layer.cornerRadius = 20.0;
        }
    }
}

@end
