//
//  UIColor+Additions.h
//
//
//  Created by lujianwen on 13-8-2.
//  Copyright (c) 2013年 LU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Addition)

+ (UIColor *)colorWithHex:(NSString *)hexColor;
+ (UIColor *)color:(UIColor *)color_ withAlpha:(float)alpha_;

@end
