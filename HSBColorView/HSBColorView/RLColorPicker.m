//
//  RLColorPicker.m
//  HSBColorView
//
//  Created by lee on 16/7/1.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "RLColorPicker.h"
@interface RLColorPicker()<RLSlideValueChangeDelegate>

@end


@implementation RLColorPicker
@synthesize slider_h ,slider_s, slider_b;

//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self)
//    {
//        
//    }
//    return self;
//}

- (id)initWithColor :(UIColor *)color withFrame:(CGRect)rect
{
    self = [super initWithFrame:rect];
    if (self)
    {
        [self setBackgroundColor:[UIColor clearColor]];
        
        slider_h = [[RLHSBSlider alloc]initWithFrame:CGRectMake(0, 5, self.frame.size.width, 30) sliderColorType:HSBColorTypeHue withColor:color];
        slider_h.sliderDelegate = self;
        [self addSubview: slider_h];
        
        slider_s = [[RLHSBSlider alloc]initWithFrame:CGRectMake(0, slider_h.frame.origin.y +50, self.frame.size.width, 30) sliderColorType:HSBColorTypeSat withColor:color];
        slider_s.sliderDelegate = self;
        [self addSubview: slider_s];
        
        slider_b = [[RLHSBSlider alloc]initWithFrame:CGRectMake(0, slider_s.frame.origin.y +50, self.frame.size.width, 30) sliderColorType:HSBColorTypeBri withColor:color];
        slider_b.sliderDelegate = self;
        [self addSubview: slider_b];
    }
    return self;
}


- (void)colorValueChange:(float)value fromType:(HSBColorType)type
{
    UIColor * color;
    
    CGFloat alpha = slider_h.alpha;
    
    switch (type)
    {
        case HSBColorTypeHue:
            //传出颜色
            [self.delegate getPickerColor:[UIColor colorWithHue:value saturation:slider_s.sliderValue brightness:slider_b.sliderValue alpha:alpha]];
            //改变另外2个slider
            color = [UIColor colorWithHue:value saturation:slider_s.sliderValue brightness:slider_b.sliderValue alpha:alpha];
            [slider_s setNewColorToDisplay:color];
            [slider_b setNewColorToDisplay:color];
            
            break;

        case HSBColorTypeSat:
            
            [self.delegate getPickerColor:[UIColor colorWithHue:slider_h.sliderValue saturation:value brightness:slider_b.sliderValue alpha:alpha]];
            color = [UIColor colorWithHue:slider_h.sliderValue saturation:value brightness:slider_b.sliderValue alpha:alpha];
            [slider_h setNewColorToDisplay:color];
            [slider_b setNewColorToDisplay:color];
            
            break;

        case HSBColorTypeBri:
            
            [self.delegate getPickerColor:[UIColor colorWithHue:slider_h.sliderValue saturation:slider_s.sliderValue brightness:value alpha:alpha]];
            color = [UIColor colorWithHue:slider_h.sliderValue saturation:slider_s.sliderValue brightness:value alpha:alpha];
            [slider_h setNewColorToDisplay:color];
            [slider_s setNewColorToDisplay:color];
            
            break;

        case HSBColorTypeAlpha:
            break;

        default:
            break;
    }
}





@end
