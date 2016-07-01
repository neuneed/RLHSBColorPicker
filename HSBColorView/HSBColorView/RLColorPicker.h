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

@property (weak, nonatomic) id<RLColorPickerDelegate> delegate;
- (id)initWithColor :(UIColor *)color withFrame:(CGRect)rect;

@end
