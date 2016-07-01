//
//  ViewController.m
//  HSBColorView
//
//  Created by lee on 16/6/30.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "ViewController.h"
#import "RLHSBSlider.h"
@interface ViewController ()<RLColorPickerDelegate>
{
    RLColorPicker * colorPicker;
    UIView * showView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UILabel * iconLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width,50)];
    [iconLabel setText:@"RLColorPicker"];
    [iconLabel setFont:[UIFont fontWithName:@"Avenir-Book" size:30]];
    [iconLabel setTextColor:[UIColor blackColor]];
    [iconLabel setNumberOfLines:0];
    [iconLabel setUserInteractionEnabled:YES];
    [iconLabel setBackgroundColor:[UIColor clearColor]];
    [iconLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:iconLabel];
    
    
    UIColor * defineColor = [UIColor colorWithRed:50.f/255.f green:134.f/255.f blue:148.f/255.f alpha:1.0f];
    
    colorPicker  = [[RLColorPicker alloc]initWithColor:defineColor withFrame:CGRectMake(0, 430, self.view.frame.size.width, 150)];
    colorPicker.delegate = self;
    [self.view addSubview:colorPicker];
    
    showView = [[UIView alloc]init];
    [showView setBackgroundColor:defineColor];
    [self.view addSubview:showView];
    [showView setCenter:CGPointMake(self.view.center.x, self.view.center.y -90)];
    [showView setBounds:CGRectMake(0, 0, 220, 220)];
    showView.layer.masksToBounds = YES;
    showView.layer.cornerRadius = showView.frame.size.width/2;
    showView.layer.borderColor = [UIColor colorWithHue:0 saturation:0 brightness:0.93 alpha:1].CGColor;
    showView.layer.borderWidth = 1.0f;
    
}


-(void)getPickerColor:(UIColor *)color
{
    [showView setBackgroundColor:color];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
