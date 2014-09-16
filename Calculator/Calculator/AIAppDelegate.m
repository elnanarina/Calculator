//
//  AppDelegate.m
//  Calculator
//
//  Created by Air on 14/8/14.
//  Copyright (c) 2014 Air. All rights reserved.
//

#import "AIAppDelegate.h"

@implementation AIAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [AIViewController new];
    self.window.backgroundColor = [UIColor colorWithRed:1 green:0.527 blue:0.973 alpha:1.0];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
