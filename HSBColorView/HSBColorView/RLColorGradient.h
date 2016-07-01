//
//  HueControl.h
//  HSBColorView
//
//  Created by lee on 16/6/30.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RLColorGradient : UIControl

- (id)initWithFrame:(CGRect)frame gradientArray:(NSArray *)colors;
@property (nonatomic ,strong) NSArray * gradientColors;


@end
