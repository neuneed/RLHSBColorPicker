//
//  RLColorPicker.h
//  HSBColorView
//
//  Created by lee on 16/7/1.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RLHSBSlider.h"


@protocol RLColorPickerDelegate <NSObject>

-(void)getPickerColor: (UIColor *)color;

@end

@interface RLColorPicker : UIView

@property (nonatomic ,strong) RLHSBSlider * slider_h;
@property (nonatomic ,strong) RLHSBSlider * slider_s;
@property (nonatomic ,strong) RLHSBSlider * slider_b;
@property (nonatomic ,strong) RLHSBSlider * slider_a;

@property (weak, nonatomic) id<RLColorPickerDelegate> delegate;

@property (nonatomic ,strong) UIColor * customColor;


/**
 *  init the three HSB slider view.
 *
 *  @param color :if color is nil,define is red.
 *  @param rect  :the three slider view rect. And rect's height need >= 28.0 px *3 to show all view.
 *
 *  @return view
 */
- (instancetype)initWithColor :(UIColor *)color withFrame:(CGRect)rect;



#warning bug: something wrong when Hue or Alpha value ==0, so do not add alpha slider now(lee)
/**
 *  init the three HSB slider view contain 'Alpha slider'
 *
 *  @param color :if color is nil,define is red.
 *  @param rect  :the three slider view rect. And rect's height need >= 28.0 px *4 to show all view.
 *
 *  @return view
 */
- (instancetype)initWithColorContainAlpha :(UIColor *)color withFrame:(CGRect)rect;

@end
