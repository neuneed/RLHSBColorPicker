//
//  RoundView.m
//  HSBColorView
//
//  Created by lee on 16/6/30.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "RLRoundView.h"
#import <QuartzCore/QuartzCore.h>


@implementation RLRoundView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor colorWithHue:0.0f saturation:0.0f brightness:0.93f alpha:1.0f];

        // border radius
        [self.layer setCornerRadius:CGRectGetWidth(frame)/2];
        
        //border
        [self.layer setBorderColor:[UIColor colorWithHue:0.0f saturation:0.0f brightness:0.89f alpha:1.0f].CGColor];
        [self.layer setBorderWidth:.5f];
        
        // drop shadow
        [self.layer setShadowColor:[UIColor colorWithHue:0.0f saturation:0.0f brightness:0.15f alpha:0.5f].CGColor];
        [self.layer setShadowOpacity: 0.8f];
        [self.layer setShadowRadius: 2.0f];
        [self.layer setShadowOffset:CGSizeMake(2.0f, 2.0f)];
        
    }
    return self;
}

@end
