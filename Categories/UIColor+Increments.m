//
//  UIColor+Increments.m
//  UIColorIncrements
//
//  Created by Colin on 3/13/14.
//  Copyright (c) 2014 Colin Jackson
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

#import "UIColor+Increments.h"

@implementation UIColor (Incrementing)

#pragma mark - HSB instantiation methods
- (UIColor *)cuc_colorWithChangesToHue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness alpha:(CGFloat)alpha
{
    /*
     Grayscale colors fail HSB conversion, but their RGB equivalents do not. Converting grayscale to RGB first allows for all colors to work as expected with this instance method.
     */
    CGFloat colorRed = 0.0f, colorGreen = 0.0f, colorBlue = 0.0f, colorAlpha = 0.0f, colorHue = 0.0f, colorSaturation = 0.0f, colorBrightness = 0.0f;
    [self getRed:&colorRed green:&colorGreen blue:&colorBlue alpha:&colorAlpha];
    UIColor *rgbColor = [UIColor colorWithRed:colorRed green:colorGreen blue:colorBlue alpha:1.0f];
    [rgbColor getHue:&colorHue saturation:&colorSaturation brightness:&colorBrightness alpha:NULL];
    
    // Hue loops rather than min/max
    colorHue += hue;
    if (colorHue >= 1.0f) colorHue -= 1.0f;
    else if (colorHue < 0.0f) colorHue += 1.0f;
    
    colorSaturation += saturation;
    colorBrightness += brightness;
    colorAlpha += alpha;
    
    return [UIColor colorWithHue:colorHue saturation:colorSaturation brightness:colorBrightness alpha:colorAlpha];
}

- (UIColor *)cuc_colorWithChangesToHue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness
{
    return [self cuc_colorWithChangesToHue:hue saturation:saturation brightness:brightness alpha:0.0f];
}

- (UIColor *)cuc_colorWithChangesToHue:(CGFloat)hue;
{
    return [self cuc_colorWithChangesToHue:hue saturation:0.0f brightness:0.0f];
}

- (UIColor *)cuc_colorWithChangesToSaturation:(CGFloat)saturation
{
    return [self cuc_colorWithChangesToHue:0.0f saturation:saturation brightness:0.0f];
}

- (UIColor *)cuc_colorWithChangesToBrightness:(CGFloat)brightness
{
    return [self cuc_colorWithChangesToHue:0.0f saturation:0.0f brightness:brightness];
}

- (UIColor *)cuc_colorWithChangesToAlpha:(CGFloat)alpha
{
    return [self cuc_colorWithChangesToHue:0.0f saturation:0.0f brightness:0.0f alpha:alpha];
}


#pragma mark - RGB instantiation methods
- (UIColor *)cuc_colorWithChangesToRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    CGFloat colorRed = 0.0f, colorGreen = 0.0f, colorBlue = 0.0f, colorAlpha = 0.0f;
    [self getRed:&colorRed green:&colorGreen blue:&colorBlue alpha:&colorAlpha];
    
    colorRed += red;
    colorGreen += green;
    colorBlue += blue;
    colorAlpha += alpha;
    
    return [UIColor colorWithRed:colorRed green:colorGreen blue:colorBlue alpha:colorAlpha];
}

- (UIColor *)cuc_colorWithChangesToRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
{
    return [self cuc_colorWithChangesToRed:red green:green blue:blue alpha:0.0f];
}

- (UIColor *)cuc_colorWithChangesToRed:(CGFloat)red
{
    return [self cuc_colorWithChangesToRed:red green:0.0f blue:0.0f];
}

- (UIColor *)cuc_colorWithChangesToGreen:(CGFloat)green
{
    return [self cuc_colorWithChangesToRed:0.0f green:green blue:0.0f];
}

- (UIColor *)cuc_colorWithChangesToBlue:(CGFloat)blue
{
    return [self cuc_colorWithChangesToRed:0.0f green:0.0f blue:blue];
}


@end
