//
//  HSBSlider.m
//  HSBColorView
//
//  Created by lee on 16/6/30.
//  Copyright © 2016年 Lee. All rights reserved.
//

#define ROUND_HEIGHT 28
#define GRADIENT_HEIGHT 4
#define GRADIENT_X 40


#import "RLHSBSlider.h"


@interface RLHSBSlider()
{
    NSArray * gradientColorArray;
}
@property (nonatomic ,assign) HSBColorType sliderType;
@property (nonatomic ,assign) CGFloat      hue;
@property (nonatomic ,assign) CGFloat      saturation;
@property (nonatomic ,assign) CGFloat      brightness;
@property (nonatomic ,assign) CGFloat      alpha;

@end

@implementation RLHSBSlider
@synthesize hue,saturation,brightness,alpha;

- (instancetype)initWithFrame:(CGRect)frame sliderColorType:(HSBColorType)type withColor:(UIColor *)color
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setBackgroundColor:[UIColor clearColor]];        
        [self initGradientViewWithType:type withColor:color];
        [self initTheRoundView];
    }
    return self;
}

- (void)initGradientViewWithType :(HSBColorType)type withColor:(UIColor *)color
{
    self.sliderType = type;
    [color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];

    switch (type)
    {
        case HSBColorTypeHue:
            
            self.sliderValue = hue;

            gradientColorArray = @[(id) [[UIColor colorWithHue:0.0 saturation:saturation brightness:brightness alpha:alpha] CGColor],
                                   (id) [[UIColor colorWithHue:0.2 saturation:saturation brightness:brightness alpha:alpha] CGColor],
                                   (id) [[UIColor colorWithHue:0.4 saturation:saturation brightness:brightness alpha:alpha] CGColor],
                                   (id) [[UIColor colorWithHue:0.6 saturation:saturation brightness:brightness alpha:alpha] CGColor],
                                   (id) [[UIColor colorWithHue:0.8 saturation:saturation brightness:brightness alpha:alpha] CGColor],
                                   (id) [[UIColor colorWithHue:1.0 saturation:saturation brightness:brightness alpha:alpha] CGColor]
                                   ];
            break;
        case HSBColorTypeSat:
            
            self.sliderValue = saturation;

            gradientColorArray = @[(id) [[UIColor colorWithHue:hue saturation:0.0 brightness:brightness alpha:alpha] CGColor],
                                   (id) [[UIColor colorWithHue:hue saturation:0.2 brightness:brightness alpha:alpha] CGColor],
                                   (id) [[UIColor colorWithHue:hue saturation:0.4 brightness:brightness alpha:alpha] CGColor],
                                   (id) [[UIColor colorWithHue:hue saturation:0.6 brightness:brightness alpha:alpha] CGColor],
                                   (id) [[UIColor colorWithHue:hue saturation:0.8 brightness:brightness alpha:alpha] CGColor],
                                   (id) [[UIColor colorWithHue:hue saturation:1.0 brightness:brightness alpha:alpha] CGColor]
                                   ];
            break;
        
        case HSBColorTypeBri:
            
            self.sliderValue = brightness;
            
            gradientColorArray = @[(id) [[UIColor colorWithHue:hue saturation:saturation brightness:0.0 alpha:alpha] CGColor],
                                   (id) [[UIColor colorWithHue:hue saturation:saturation brightness:0.2 alpha:alpha] CGColor],
                                   (id) [[UIColor colorWithHue:hue saturation:saturation brightness:0.4 alpha:alpha] CGColor],
                                   (id) [[UIColor colorWithHue:hue saturation:saturation brightness:0.6 alpha:alpha] CGColor],
                                   (id) [[UIColor colorWithHue:hue saturation:saturation brightness:0.8 alpha:alpha] CGColor],
                                   (id) [[UIColor colorWithHue:hue saturation:saturation brightness:1.0 alpha:alpha] CGColor]
                                   ];
            break;
            
        case HSBColorTypeAlpha:
            gradientColorArray = @[(id) [[UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:0.0] CGColor],
                                   (id) [[UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:0.2] CGColor],
                                   (id) [[UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:0.4] CGColor],
                                   (id) [[UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:0.6] CGColor],
                                   (id) [[UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:0.8] CGColor],
                                   (id) [[UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1.0] CGColor]
                                   ];
            break;
            
        default:
            break;
    }
    
    self.gradientView = [[RLColorGradient alloc]initWithFrame:CGRectMake( GRADIENT_X, self.frame.size.height/2 - GRADIENT_HEIGHT/2, self.frame.size.width - GRADIENT_X *2 , GRADIENT_HEIGHT) gradientArray:gradientColorArray];
    [self addSubview:self.gradientView];
}


- (void)initTheRoundView
{
    self.roundView = [[RLRoundView alloc]initWithFrame:CGRectMake(GRADIENT_X/2, 0, ROUND_HEIGHT, ROUND_HEIGHT)];
    self.roundView.center = CGPointMake(GRADIENT_X  + self.sliderValue * self.gradientView.frame.size.width, self.frame.size.height/2);
    [self.roundView setExclusiveTouch:YES];
    [self addSubview:self.roundView];
    
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(dragging:)];
    [self.roundView addGestureRecognizer:pan];
}

-(void)dragging:(UIPanGestureRecognizer *)gesture
{
    NSLog(@"pan");
    if ([gesture state] == UIGestureRecognizerStateBegan)
    {
        NSLog(@"pan began");
    }
    else if([gesture state] == UIGestureRecognizerStateChanged)
    {
        CGPoint translation = [gesture translationInView:self.roundView];
        CGPoint viewCenter = self.roundView.center;

        viewCenter.x += translation.x;
        if (viewCenter.x < self.gradientView.frame.origin.x)
        {
            viewCenter.x = self.gradientView.frame.origin.x;
        }
        else if (viewCenter.x > self.gradientView.frame.origin.x + self.gradientView.frame.size.width)
        {
            viewCenter.x =self.gradientView.frame.origin.x + self.gradientView.frame.size.width;
        }
        
        self.roundView.center = viewCenter;
        [gesture setTranslation:CGPointZero inView:self.roundView];
        
        //Get percent value
        [self setColorWithValue:(self.roundView.center.x - self.gradientView.frame.origin.x)/ self.gradientView.frame.size.width];
    }
    else if([gesture state] == UIGestureRecognizerStateCancelled || [gesture state] == UIGestureRecognizerStateFailed || [gesture state] == UIGestureRecognizerStateEnded)
    {
        
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touch began");
}

#pragma mark
#pragma mark setColor

-(void)setColorWithValue:(float)percent
{
    self.sliderValue = percent;
    [self.sliderDelegate colorValueChange:percent fromType:self.sliderType];
}

-(void)setNewColorToDisplay:(UIColor *)color
{
    NSArray * colors;
    [color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    
    switch (self.sliderType) {
        case HSBColorTypeHue:
            colors = @[(id) [[UIColor colorWithHue:0.0 saturation:saturation brightness:brightness alpha:alpha ] CGColor],
                       (id) [[UIColor colorWithHue:0.2 saturation:saturation brightness:brightness alpha:alpha ] CGColor],
                       (id) [[UIColor colorWithHue:0.4 saturation:saturation brightness:brightness alpha:alpha ] CGColor],
                       (id) [[UIColor colorWithHue:0.6 saturation:saturation brightness:brightness alpha:alpha ] CGColor],
                       (id) [[UIColor colorWithHue:0.8 saturation:saturation brightness:brightness alpha:alpha ] CGColor],
                       (id) [[UIColor colorWithHue:1.0 saturation:saturation brightness:brightness alpha:alpha ] CGColor]
                         ];
            break;
        case HSBColorTypeSat:
            colors = @[(id) [[UIColor colorWithHue:hue saturation:0.0 brightness:brightness alpha:alpha ] CGColor],
                       (id) [[UIColor colorWithHue:hue saturation:0.2 brightness:brightness alpha:alpha ] CGColor],
                       (id) [[UIColor colorWithHue:hue saturation:0.4 brightness:brightness alpha:alpha ] CGColor],
                       (id) [[UIColor colorWithHue:hue saturation:0.6 brightness:brightness alpha:alpha ] CGColor],
                       (id) [[UIColor colorWithHue:hue saturation:0.8 brightness:brightness alpha:alpha ] CGColor],
                       (id) [[UIColor colorWithHue:hue saturation:1.0 brightness:brightness alpha:alpha ] CGColor]
                       ];
            break;
            
        case HSBColorTypeBri:
            colors = @[(id) [[UIColor colorWithHue:hue saturation:saturation brightness:0.0 alpha:alpha ] CGColor],
                       (id) [[UIColor colorWithHue:hue saturation:saturation brightness:0.2 alpha:alpha ] CGColor],
                       (id) [[UIColor colorWithHue:hue saturation:saturation brightness:0.4 alpha:alpha ] CGColor],
                       (id) [[UIColor colorWithHue:hue saturation:saturation brightness:0.6 alpha:alpha ] CGColor],
                       (id) [[UIColor colorWithHue:hue saturation:saturation brightness:0.8 alpha:alpha ] CGColor],
                       (id) [[UIColor colorWithHue:hue saturation:saturation brightness:1.0 alpha:alpha ] CGColor]
                       ];
            break;
            
        case HSBColorTypeAlpha:
            colors = @[(id) [[UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:0.0 ] CGColor],
                       (id) [[UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:0.2 ] CGColor],
                       (id) [[UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:0.4 ] CGColor],
                       (id) [[UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:0.6 ] CGColor],
                       (id) [[UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:0.8 ] CGColor],
                       (id) [[UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1.0 ] CGColor]
                       ];
            break;
            
        default:
            break;
    }
    [self.gradientView setGradientColors:colors];
    
}


@end
