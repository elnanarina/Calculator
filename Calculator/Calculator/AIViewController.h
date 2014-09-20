//
//  ViewController.h
//  Calculator
//
//  Created by Air on 14/8/14.
//  Copyright (c) 2014 Air. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AIView.h"

@interface AIViewController : UIViewController

@property (nonatomic) AIView *calculatorView;

@property (nonatomic) NSMutableString *number;
@property (nonatomic) NSMutableString *memory;

@property (nonatomic) NSString *operand;
@property (nonatomic) NSString *result;

@property (nonatomic) NSNumberFormatter *formatter;

@property (nonatomic) NSDecimalNumber *firstDecimalNumber;
@property (nonatomic) NSDecimalNumber *lastDecimalNumber;

@end
