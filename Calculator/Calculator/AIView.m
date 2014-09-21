//
//  AIView.m
//  Calculator
//
//  Created by Air on 14/8/14.
//  Copyright (c) 2014 Air. All rights reserved.
//

#import "AIView.h"

@implementation AIView

- (id)init {
    self = [super init];
    
    if (self) {
        _display = [UILabel new];
        
        _buttonDivide = [UIButton new];
        _buttonEqual = [UIButton new];
        _buttonMinus = [UIButton new];
        _buttonMultiply = [UIButton new];
        _buttonPlus = [UIButton new];
        _buttonPoint = [UIButton new];
        _buttonDel = [UIButton new];
        _digitalButtonsList = [[NSMutableArray alloc] init];
        _actionButtonsList = [[NSArray alloc] initWithObjects: _buttonPoint, _buttonEqual, _buttonPlus, _buttonMinus, _buttonMultiply, _buttonDivide, _buttonDel, nil];
        NSArray *operations = [[NSArray alloc] initWithObjects:@".", @"=", @"+", @"-", @"*", @"/", @"C", nil];
        NSString *number;
        UIButton *digitalButton;
        
        for ( int i = 0; i < 10; i++ ) {
            digitalButton = [[UIButton alloc] init];
            digitalButton.backgroundColor = [UIColor whiteColor];
            number = [[NSString alloc] initWithFormat:@"%i", i];
            [digitalButton setTitle:number forState:UIControlStateNormal];
            [digitalButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            digitalButton.tag = i;
            digitalButton.layer.cornerRadius = digitalButton.bounds.size.width / 2.0;
            [_digitalButtonsList addObject:digitalButton];
            [self addSubview:digitalButton];
        }
        
        int index = 0;
        for ( UIButton *button in _actionButtonsList ) {
            button.backgroundColor = [UIColor greenColor];
            [button setTitle:operations[index] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            index += 1;
            button.layer.cornerRadius = 20.0;
            [self addSubview:button];
        }
        
        _display.backgroundColor = [UIColor whiteColor];
        _display.text = @"0";
        [self addSubview:_display];
    }
    
    return self;
}

- (void)layoutSubviews {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    UIDeviceOrientation currentOrientation =  [[UIDevice currentDevice] orientation];
    if (UIDeviceOrientationIsLandscape(currentOrientation)) {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        
        _display.frame = CGRectMake(screenRect.size.height * 0.025, 30, screenRect.size.height * 0.95, 40);
        
        ((UIButton *)_digitalButtonsList[1]).frame = CGRectMake(screenRect.size.height * 0.025, 85, 70, 70);
        ((UIButton *)_digitalButtonsList[2]).frame = CGRectMake(screenRect.size.height * 0.1979, 85, 70, 70);
        ((UIButton *)_digitalButtonsList[3]).frame = CGRectMake(screenRect.size.height * 0.3646, 85, 70, 70);
        ((UIButton *)_digitalButtonsList[4]).frame = CGRectMake(screenRect.size.height * 0.025, 165, 70, 70);
        ((UIButton *)_digitalButtonsList[5]).frame = CGRectMake(screenRect.size.height * 0.1979, 165, 70, 70);
        ((UIButton *)_digitalButtonsList[6]).frame = CGRectMake(screenRect.size.height * 0.3646, 165, 70, 70);
        ((UIButton *)_digitalButtonsList[7]).frame = CGRectMake(screenRect.size.height * 0.025, 245, 70, 70);
        ((UIButton *)_digitalButtonsList[8]).frame = CGRectMake(screenRect.size.height * 0.1979, 245, 70, 70);
        ((UIButton *)_digitalButtonsList[9]).frame = CGRectMake(screenRect.size.height * 0.3646, 245, 70, 70);
        ((UIButton *)_digitalButtonsList[0]).frame = CGRectMake(screenRect.size.height * 0.5521, 85, 70, 70);
        
        _buttonPoint.frame = CGRectMake(screenRect.size.height * 0.5521, 165, 70, 70);
        _buttonDel.frame = CGRectMake(screenRect.size.height * 0.5521, 245, 70, 70);
        _buttonPlus.frame = CGRectMake(screenRect.size.height * 0.7396, 85, 50, 50);
        _buttonMinus.frame = CGRectMake(screenRect.size.height * 0.8646, 85, 50, 50);
        _buttonMultiply.frame = CGRectMake(screenRect.size.height * 0.7396, 165, 50, 50);
        _buttonDivide.frame = CGRectMake(screenRect.size.height * 0.8646, 165, 50, 50);
        
        if ( screenRect.size.height == 480 ) {
            _buttonEqual.frame = CGRectMake(screenRect.size.height * 0.7396, 245, screenRect.size.height * 0.0208 + 100, 70);
        } else {
            _buttonEqual.frame = CGRectMake(screenRect.size.height * 0.7396, 245, screenRect.size.height * 0.0416 + 100, 70);
        }
    } else {
        int width = 15;
        double height = 0.3333;
        int size = 70;
        
        for ( UIButton *button in _digitalButtonsList ) {
            if ( button == _digitalButtonsList[0] ) {
                button.frame = CGRectMake(width, screenRect.size.height * 0.8333, size, size);
            } else {
                if ( button == _digitalButtonsList[4] || button == _digitalButtonsList[7] ) {
                    width = 15;
                    height += 0.1667;
                }
                button.frame = CGRectMake(width, screenRect.size.height * height, size, size);
                width += 80;
            }
            button.layer.cornerRadius = button.bounds.size.width / 2.0;
        }
            
        _display.frame = CGRectMake(15, screenRect.size.height * 0.125, 285, 70);
        
        _buttonPoint.frame = CGRectMake(95, screenRect.size.height * 0.8333, 70, 70);
        _buttonDel.frame = CGRectMake(175, screenRect.size.height * 0.8333, 70, 70);
        _buttonPlus.frame = CGRectMake(255, screenRect.size.height * 0.3333, 50, 50);
        _buttonMinus.frame = CGRectMake(255, screenRect.size.height * 0.4583, 50, 50);
        _buttonMultiply.frame = CGRectMake(255, screenRect.size.height * 0.5833, 50, 50);
        _buttonDivide.frame = CGRectMake(255, screenRect.size.height * 0.7083, 50, 50);
        _buttonEqual.frame = CGRectMake(255, screenRect.size.height * 0.8333, 50, 70);
    }
}

@end
