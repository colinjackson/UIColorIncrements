//
//  UIColor+Increments.h
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

#import <UIKit/UIKit.h>

@interface UIColor (Increments)

//  HSB-space UIColor incrementing
- (UIColor *)cho_colorWithChangeToHue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness alpha:(CGFloat)alpha;
- (UIColor *)cho_colorWithChangeToHue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness;
- (UIColor *)cho_colorWithChangeToHue:(CGFloat)hue;
- (UIColor *)cho_colorWithChangeToSaturation:(CGFloat)saturation;
- (UIColor *)cho_colorWithChangeToBrightness:(CGFloat)brightness;

//  RGB-space UIColor incrementing
- (UIColor *)cho_colorWithChangeToRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
- (UIColor *)cho_colorWithChangeToRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
- (UIColor *)cho_colorWithChangeToRed:(CGFloat)red;
- (UIColor *)cho_colorWithChangeToGreen:(CGFloat)green;
- (UIColor *)cho_colorWithChangeToBlue:(CGFloat)blue;

//  Alpha incrementing
//      Instantiating new colors
- (UIColor *)cho_colorWithChangeToAlpha:(CGFloat)alpha;

@end
