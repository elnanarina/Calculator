//
//  ViewController.m
//  Calculator
//
//  Created by Air on 14/8/14.
//  Copyright (c) 2014 Air. All rights reserved.
//

#import "AIViewController.h"

@interface AIViewController () {
    int isGotResult;
    int sizeOfLabel;
}

@end

@implementation AIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    isGotResult = 0;
    sizeOfLabel = 25;
    _number = [[NSMutableString alloc] init];
    _memory = [[NSMutableString alloc] init];
    _operand = @"+";
    _formatter = [[NSNumberFormatter alloc] init];
    [_formatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [_formatter setGeneratesDecimalNumbers:YES];
    
    [((UIButton *)_calculatorView.digitalButtonsList[0]) addTarget:self
                                action:@selector(pressDigitalButton:)
                      forControlEvents:UIControlEventTouchUpInside];
    [((UIButton *)_calculatorView.digitalButtonsList[1]) addTarget:self
                                                            action:@selector(pressDigitalButton:)
                                                  forControlEvents:UIControlEventTouchUpInside];
    [((UIButton *)_calculatorView.digitalButtonsList[2]) addTarget:self
                                                            action:@selector(pressDigitalButton:)
                                                  forControlEvents:UIControlEventTouchUpInside];
    [((UIButton *)_calculatorView.digitalButtonsList[3]) addTarget:self
                                                            action:@selector(pressDigitalButton:)
                                                  forControlEvents:UIControlEventTouchUpInside];
    [((UIButton *)_calculatorView.digitalButtonsList[4]) addTarget:self
                                                            action:@selector(pressDigitalButton:)
                                                  forControlEvents:UIControlEventTouchUpInside];
    [((UIButton *)_calculatorView.digitalButtonsList[5]) addTarget:self
                                                            action:@selector(pressDigitalButton:)
                                                  forControlEvents:UIControlEventTouchUpInside];
    [((UIButton *)_calculatorView.digitalButtonsList[6]) addTarget:self
                                                            action:@selector(pressDigitalButton:)
                                                  forControlEvents:UIControlEventTouchUpInside];
    [((UIButton *)_calculatorView.digitalButtonsList[7]) addTarget:self
                                                            action:@selector(pressDigitalButton:)
                                                  forControlEvents:UIControlEventTouchUpInside];
    [((UIButton *)_calculatorView.digitalButtonsList[8]) addTarget:self
                                                            action:@selector(pressDigitalButton:)
                                                  forControlEvents:UIControlEventTouchUpInside];
    [((UIButton *)_calculatorView.digitalButtonsList[9]) addTarget:self
                                                            action:@selector(pressDigitalButton:)
                                                  forControlEvents:UIControlEventTouchUpInside];
    
    [_calculatorView.buttonDel addTarget:self
                                  action:@selector(pressButton:)
                        forControlEvents:UIControlEventTouchUpInside];
    [_calculatorView.buttonPoint addTarget:self
                                    action:@selector(pressButton:)
                          forControlEvents:UIControlEventTouchUpInside];
    
    [_calculatorView.buttonPlus addTarget:self
                                   action:@selector(pressActionButton:)
                         forControlEvents:UIControlEventTouchUpInside];
    [_calculatorView.buttonMinus addTarget:self
                                    action:@selector(pressActionButton:)
                          forControlEvents:UIControlEventTouchUpInside];
    [_calculatorView.buttonMultiply addTarget:self
                                       action:@selector(pressActionButton:)
                          forControlEvents:UIControlEventTouchUpInside];
    [_calculatorView.buttonDivide addTarget:self
                                     action:@selector(pressActionButton:)
                             forControlEvents:UIControlEventTouchUpInside];
    [_calculatorView.buttonEqual addTarget:self
                                    action:@selector(pressActionButton:)
                          forControlEvents:UIControlEventTouchUpInside];
}

- (void)loadView {
    _calculatorView = [AIView new];
    self.view = _calculatorView;
}

- (void)pressDigitalButton:(UIButton*)sender {
    NSString *displayString = [[NSString alloc] initWithFormat:@"%i", sender.tag];
    if ( isGotResult == 1 ) {
        [_number setString:@""];
    }
    if ( _number.length <= sizeOfLabel ) {
        [_number appendString:displayString];
    }
    _calculatorView.display.text = _number;
    isGotResult = 0;
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
    }
}

- (void)pressActionButton:(UIButton*)sender {
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
        isGotResult = 1;
        _firstDecimalNumber = (NSDecimalNumber*)[_formatter numberFromString:_memory];
        _lastDecimalNumber = (NSDecimalNumber*)[_formatter numberFromString:_number];
        
        if ( [_operand isEqualToString:@"+"] ) {
            _firstDecimalNumber = [_firstDecimalNumber decimalNumberByAdding:_lastDecimalNumber];
            _result = _firstDecimalNumber.stringValue;
            [_number setString:_result];
            [_memory setString:@""];
            if (_result.length > sizeOfLabel ) {
                _calculatorView.display.text = [[_result substringToIndex:sizeOfLabel] stringByAppendingString:@"e+"];
            } else {
                _calculatorView.display.text = _result;
            }
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
            if (_result.length > sizeOfLabel ) {
                _calculatorView.display.text = [[_result substringToIndex:25] stringByAppendingString:@"e+"];
            } else {
                _calculatorView.display.text = _result;
            }
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
        [self.view layoutSubviews];
        self.view.backgroundColor = [UIColor colorWithRed:1 green:0.527 blue:0.973 alpha:1.0];
    } else {
        [self.view layoutSubviews];
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"15.jpg"]]];
    }
}

@end
