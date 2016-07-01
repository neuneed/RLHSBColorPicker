//
//  HSBSlider.h
//  HSBColorView
//
//  Created by lee on 16/6/30.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RLRoundView.h"
#import "RLColorGradient.h"

/**
     H 0 — 360  色相    Hue
     S 0 - 1    饱和度  Saturation
     B 0 - 1    亮度    Brightness
 */
typedef enum {
    HSBColorTypeHue,
    HSBColorTypeSat,
    HSBColorTypeBri,
    HSBColorTypeAlpha
} HSBColorType;


@protocol RLSlideValueChangeDelegate <NSObject>

@optional
-(void)colorValueChange :(float)value fromType:(HSBColorType)type;

@end


@interface RLHSBSlider : UIControl

- (id)initWithFrame:(CGRect)frame sliderColorType:(HSBColorType)type withColor:(UIColor *)color;
@property (nonatomic ,strong) RLRoundView * roundView;
@property (nonatomic ,strong) RLColorGradient * gradientView;

@property (nonatomic ,strong) UIColor * sliderColor;
@property (nonatomic ,assign) CGFloat sliderValue;

@property (weak, nonatomic) id<RLSlideValueChangeDelegate> sliderDelegate;

-(void)setNewColorToDisplay:(UIColor *)color;

@end
