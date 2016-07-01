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
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor colorWithHue:0 saturation:0 brightness:0.93 alpha:1];

        // border radius
        [self.layer setCornerRadius:frame.size.width/2];
        
        // border
//        [self.layer setBorderColor:[UIColor lightGrayColor].CGColor];
//        [self.layer setBorderWidth:1.0f];
        
        // drop shadow
        [self.layer setShadowColor:[UIColor colorWithHue:0 saturation:0 brightness:0.15 alpha:0.5].CGColor];
        [self.layer setShadowOpacity:0.8];
        [self.layer setShadowRadius:3.0];
        [self.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
        
    }
    return self;
}

@end
