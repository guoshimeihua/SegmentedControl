//
//  UIColor+Util.h
//  iosapp
//
//  Created by chenhaoxiang on 14-10-18.
//  Copyright (c) 2014年 oschina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Util)

+ (UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHex:(int)hexValue;

+ (UIColor *)themeColor;
+ (UIColor *)nameColor;

@end
