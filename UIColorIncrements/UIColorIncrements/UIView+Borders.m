//
//  UIView+Borders.m
//  UIColorIncrements
//
//  Created by Colin on 3/16/14.
//  Copyright (c) 2014 Colin Jackson. All rights reserved.
//

#import "UIView+Borders.h"

@implementation UIView (Borders)

- (void)setRoundedBordersRadius:(CGFloat)radius borderColor:(UIColor *)color borderWidth:(CGFloat)borderWidth
{
    self.layer.masksToBounds = YES;
    
    self.layer.cornerRadius = radius;
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = borderWidth;
}

@end
