//
//  RLColorPicker.m
//  HSBColorView
//
//  Created by lee on 16/7/1.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "RLColorPicker.h"
@interface RLColorPicker()<RLSlideValueChangeDelegate>

@property (nonatomic ,assign) BOOL containAlpha;

@end


@implementation RLColorPicker
@synthesize slider_h ,slider_s, slider_b ,slider_a;

- (instancetype)initWithColor :(UIColor *)color withFrame:(CGRect)rect
{
    self = [super initWithFrame:rect];
    if (self)
    {
        [self setBackgroundColor:[UIColor clearColor]];
        self.containAlpha = NO;
        [self setupSliderViewContainAlpha:self.containAlpha];
        self.customColor = color;
    }
    return self;
}

- (instancetype)initWithColorContainAlpha :(UIColor *)color withFrame:(CGRect)rect
{
    self = [super initWithFrame:rect];
    if (self)
    {
        [self setBackgroundColor:[UIColor clearColor]];
        self.containAlpha = YES;
        [self setupSliderViewContainAlpha:self.containAlpha];
        self.customColor = color;

    }
    return self;
}


- (void)setupSliderViewContainAlpha :(BOOL)contain;
{
    CGFloat sliderHeight = contain? (self.frame.size.height-10)/4: (self.frame.size.height-10)/3;
    
    slider_h = [[RLHSBSlider alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, sliderHeight) sliderColorType:HSBColorTypeHue withColor:self.customColor];
    slider_h.sliderDelegate = self;
    [self addSubview: slider_h];
    
    slider_s = [[RLHSBSlider alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(slider_h.frame) +5, self.frame.size.width, sliderHeight) sliderColorType:HSBColorTypeSat withColor:self.customColor];
    slider_s.sliderDelegate = self;
    [self addSubview: slider_s];
    
    slider_b = [[RLHSBSlider alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(slider_s.frame) +5, self.frame.size.width, sliderHeight) sliderColorType:HSBColorTypeBri withColor:self.customColor];
    slider_b.sliderDelegate = self;
    [self addSubview: slider_b];

    if (contain)
    {
        slider_a = [[RLHSBSlider alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(slider_b.frame), self.frame.size.width, sliderHeight) sliderColorType:HSBColorTypeAlpha withColor:self.customColor];
        slider_a.sliderDelegate = self;
        [self addSubview: slider_a];
    }
}


- (void)setCustomColor:(UIColor *)customColor
{
    _customColor = customColor;
    if (_customColor)
    {
        if (slider_h && slider_s && slider_h)
        {
            CGFloat h,s,b,a;
            [_customColor getHue:&h saturation:&s brightness:&b alpha:&a];
            
            [slider_h moveSliderByValue:h];
            [slider_s moveSliderByValue:s];
            [slider_b moveSliderByValue:b];
        }
    }
}

- (void)colorValueChange:(float)value fromType:(HSBColorType)type
{
    UIColor * color;
    CGFloat alpha = self.containAlpha ? value : 1.0f;
    switch (type)
    {
        case HSBColorTypeHue:
            
            //color delegate
            [self.delegate getPickerColor:[UIColor colorWithHue:value saturation:slider_s.sliderValue brightness:slider_b.sliderValue alpha:alpha]];
            //change other slider color
            color = [UIColor colorWithHue:value saturation:slider_s.sliderValue brightness:slider_b.sliderValue alpha:alpha];
            [slider_s setNewColorToDisplay:color];
            [slider_b setNewColorToDisplay:color];
            if (self.containAlpha)
            {
                [slider_a setNewColorToDisplay:color];
            }
            break;

        case HSBColorTypeSat:
            
            [self.delegate getPickerColor:[UIColor colorWithHue:slider_h.sliderValue saturation:value brightness:slider_b.sliderValue alpha:alpha]];
            color = [UIColor colorWithHue:slider_h.sliderValue saturation:value brightness:slider_b.sliderValue alpha:alpha];
            [slider_h setNewColorToDisplay:color];
            [slider_b setNewColorToDisplay:color];
            if (self.containAlpha)
            {
                [slider_a setNewColorToDisplay:color];
            }
            break;

        case HSBColorTypeBri:
            
            [self.delegate getPickerColor:[UIColor colorWithHue:slider_h.sliderValue saturation:slider_s.sliderValue brightness:value alpha:alpha]];
            color = [UIColor colorWithHue:slider_h.sliderValue saturation:slider_s.sliderValue brightness:value alpha:alpha];
            [slider_h setNewColorToDisplay:color];
            [slider_s setNewColorToDisplay:color];
            if (self.containAlpha)
            {
                [slider_a setNewColorToDisplay:color];
            }
            break;

        case HSBColorTypeAlpha:
            
            if (self.containAlpha)
            {
                [self.delegate getPickerColor:[UIColor colorWithHue:slider_h.sliderValue saturation:slider_s.sliderValue brightness:slider_b.sliderValue alpha:value]];
                color = [UIColor colorWithHue:slider_h.sliderValue saturation:slider_s.sliderValue brightness:slider_b.sliderValue alpha:value];
                [slider_h setNewColorToDisplay:color];
                [slider_s setNewColorToDisplay:color];
                [slider_b setNewColorToDisplay:color];
            }
            break;

        default:
            break;
    }
}




@end
