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
    UIButton * leftView;
    UIButton * resetButton;
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
    
    
    UIColor * defineColor = [UIColor cyanColor];
    colorPicker  = [[RLColorPicker alloc]initWithColor:defineColor withFrame:CGRectMake(0, 380, self.view.frame.size.width, 180)];
    colorPicker.delegate = self;
    [self.view addSubview:colorPicker];
    
    leftView = [[UIButton alloc]init];
    [leftView setBackgroundColor:defineColor];
    [self.view addSubview:leftView];
    [leftView setCenter:CGPointMake(self.view.center.x, self.view.center.y -110)];
    [leftView setBounds:CGRectMake(0, 0, 200, 200)];
    leftView.layer.masksToBounds = YES;
    leftView.layer.cornerRadius = leftView.frame.size.width/2;
    leftView.layer.borderColor = [UIColor colorWithHue:0 saturation:0 brightness:0.93 alpha:1].CGColor;
    leftView.layer.borderWidth = 1.0f;
    [leftView addTarget:self action:@selector(leftViewClick:) forControlEvents:UIControlEventTouchUpInside];
    
    resetButton = [[UIButton alloc]init];
    [resetButton setBackgroundColor:[UIColor colorWithRed:0.1 green:0.4 blue:0.8 alpha:1]];
    [self.view addSubview:resetButton];
    [resetButton setCenter:CGPointMake(self.view.center.x, CGRectGetMaxY(colorPicker.frame)+ 80)];
    [resetButton setBounds:CGRectMake(0, 0, 100, 50)];
    resetButton.layer.masksToBounds = YES;
    resetButton.layer.cornerRadius = 5;
    resetButton.layer.borderColor = [UIColor colorWithHue:0 saturation:0 brightness:0.93 alpha:1].CGColor;
    resetButton.layer.borderWidth = 1.0f;
    [resetButton addTarget:self action:@selector(resetButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [resetButton setTitle:@"reset Color" forState:UIControlStateNormal];
    
}

- (void)leftViewClick: (UIButton *)sender
{
    
}

- (void)resetButtonClick: (UIButton *)sender
{
    [colorPicker setCustomColor:[UIColor orangeColor]];
}

-(void)getPickerColor: (UIColor *)color
{
    [leftView setBackgroundColor:color];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
