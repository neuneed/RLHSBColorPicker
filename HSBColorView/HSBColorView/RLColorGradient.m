//
//  HueControl.m
//  HSBColorView
//
//  Created by lee on 16/6/30.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "RLColorGradient.h"
@interface RLColorGradient ()
@end



@implementation RLColorGradient


- (instancetype)initWithFrame:(CGRect)frame gradientArray:(NSArray *)colors
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_alpha.png"]]];

        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 2.5f;
        self.layer.borderWidth = .5f;
        self.layer.borderColor = [UIColor colorWithHue:0 saturation:0 brightness:0.15 alpha:0.1].CGColor;
        self.gradientColors = colors;

    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
}

- (void)setGradientColors:(NSArray *)gradientColors
{
    _gradientColors = gradientColors;

    CAGradientLayer *layerToRemove;
    for (CALayer *aLayer in self.layer.sublayers) {
        if ([aLayer isKindOfClass:[CAGradientLayer class]]) {
            layerToRemove = (CAGradientLayer *)aLayer;
        }
    }
    [layerToRemove removeFromSuperlayer];
    
    CAGradientLayer *newLayer = [CAGradientLayer layer];
    newLayer.frame = self.bounds;
    newLayer.colors = _gradientColors;
    newLayer.startPoint = CGPointMake(0, 0);
    newLayer.endPoint   = CGPointMake(1, 0);
    [self.layer insertSublayer:newLayer atIndex:0];
}


@end


