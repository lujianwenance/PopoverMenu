//
//  UIColor+Additions.h
//
//
//  Created by lujianwen on 13-8-2.
//  Copyright (c) 2013年 LU. All rights reserved.
//

#import "UIColor+Addition.h"

@implementation UIColor (Addition)

+ (UIColor *)colorWithHex:(NSString *)hexColor
{
	
	if (hexColor == nil) {
        return nil;
    }
    if ([hexColor length] < 7 ) {
        return nil;
    }
    
    unsigned int red, green, blue;
    NSRange range;
    range.length = 2;
    
    range.location = 1;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    range.location = 3;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    range.location = 5;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:1.0f];
	
}

+ (UIColor *)color:(UIColor *)color_ withAlpha:(float)alpha_
{
    UIColor *uicolor = color_;
    CGColorRef colorRef = [uicolor CGColor];
    
    int numComponents = (int)CGColorGetNumberOfComponents(colorRef);
    
    CGFloat red = 0.0;
    CGFloat green = 0.0;
    CGFloat blue = 0.0;
//    CGFloat alpha = 0.0;
    if (numComponents == 4)
    {
        const CGFloat *components = CGColorGetComponents(colorRef);
        red = components[0];
        green = components[1];
        blue = components[2];
//        alpha = components[3];
    }
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha_];
}

@end
