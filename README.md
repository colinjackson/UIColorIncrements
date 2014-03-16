#UIColorIncrements

`UIColorIncrements` is a drop-in UIColor category for incrementally changing a UIColor value in HSB or RGB space.


##Supported Platforms

I've only tested these on iOS 7.0.6+, iPhone and iPad idioms.


##Usage

The category is in the `Categories` folder. Drag and drop:

	- `UIColor+Incrementing.h`
	- `UIColor+Incrementing.m`

into your Xcode project. Then, just `#import` the .h file where necessary as usual.

`-cho_colorWithChangeToHue:saturation:brightness:alpha:` returns a `UIColor` object with hue, saturation, brightness and alpha levels equal to the instance's values plus the `CGFloat` arguments. Hue, saturation, brightness and alpha `UIColor` values range from 0.0 to 1.0. 

Hues that are incremented to be weakly greater than 1.0 or strictly less than 0.0 are looped between those values, while saturation, brightness, alpha, and color values are all passed regardless of their values, since for the `UIColor` convenience constructor, "values below 0.0 are interpreted as 0.0, and values above 1.0 are interpreted as 1.0" (from the [*UIColor Class Reference*](https://developer.apple.com/library/ios/documentation/uikit/reference/UIColor_Class/Reference/Reference.html)).

```Objective-C
UIColor *testColor = [UIColor colorWithHue:0.5f saturation: 0.9f brightness:0.5f alpha:1.0f];

testColor = [testColor cho_colorWithChangeToHue:0.9f saturation:0.2f brightness:-0.2f alpha:0.7f];

CGFloat newHue = 0.0f, newSaturation = 0.0f, newBrightness = 0.0f, newAlpha = 0.0f;
[testColor getHue:&newHue saturation:&newSaturation brightness:&newBrightness alpha:&newAlpha];

NSLog(@"%f", newHue);           // returns "0.4" -- hue is looped for consistency
NSLog(@"%f", newSaturation);    // returns "1.0" -- saturation, brightness and alpha have floors and ceilings rather than looping behavior
NSLog(@"%f", newBrightness);    // returns "0.3"
NSLog(@"%f", newAlpha);         // returns "0.7"

```

When this method is called on a UIColor object in the grayscale space, it is converted to an HSB-space UIColor object with hue = 0.0 and saturation = 0.0, brightness equal to the original grayscale value, and alpha equal to the original value, before running the incrementation.

`UIColor+Increments` also includes the methods:

- `-cho_colorWithChangeToHue:saturation:brightness:`
- `-cho_colorWithChangeToHue:`
- `-cho_colorWithChangeToSaturation:`
- `-cho_colorWithChangeToBrightness:`

The following methods are also included for incrementing in RGB space. Red, green, and blue values have floors and ceilings at 0.0 and 1.0 rather than looping behavior.

- `-cho_colorWithChangeToRed:green:blue:alpha:`
- `-cho_colorWithChangeToRed:green:blue:`
- `-cho_colorWithChangeToRed:`
- `-cho_colorWithChangeToGreen:`
- `-cho_colorWithChangeToBlue:`

Alpha can also be incremented alone:

- `-cho_colorWithChangeToAlpha:`

###Testing app
Use the `UIStepper`s to choose the value to increment or decrement the background color. Use the submit button to call either `cho_colorWithChangeToHue:saturation:brightness:` or `cho_colorWithChangeToRed:green:blue:`, passing the displayed values as the arguments. Use the RGB/HSB button to toggle between the HSB/RGB color spaces.


##Credits

`UIColorIncrements` was written by Colin Jackson.


##License

`UIColorIncrements` is licensed under the MIT license, which is reproduced in its entirety here:

> Copyright (c) 2014 Colin Jackson
> 
> Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
> 
> The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
> 
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.