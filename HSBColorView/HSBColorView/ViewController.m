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
    UIButton * rightView;
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
    
    
    UIColor * defineColor = [UIColor grayColor];
    colorPicker  = [[RLColorPicker alloc]initWithColor:nil withFrame:CGRectMake(0, 380, self.view.frame.size.width, 180)];
    colorPicker.delegate = self;
    [self.view addSubview:colorPicker];
    
    leftView = [[UIButton alloc]init];
    [leftView setBackgroundColor:defineColor];
    [self.view addSubview:leftView];
    [leftView setCenter:CGPointMake(100, self.view.center.y -110)];
    [leftView setBounds:CGRectMake(0, 0, 200, 200)];
    leftView.layer.masksToBounds = YES;
    leftView.layer.cornerRadius = leftView.frame.size.width/2;
    leftView.layer.borderColor = [UIColor colorWithHue:0 saturation:0 brightness:0.93 alpha:1].CGColor;
    leftView.layer.borderWidth = 1.0f;
    [leftView addTarget:self action:@selector(leftViewClick:) forControlEvents:UIControlEventTouchUpInside];
    
    rightView = [[UIButton alloc]init];
    [rightView setBackgroundColor:defineColor];
    [self.view addSubview:rightView];
    [rightView setCenter:CGPointMake(self.view.frame.size.width-100, self.view.center.y -110)];
    [rightView setBounds:CGRectMake(0, 0, 200, 200)];
    rightView.layer.masksToBounds = YES;
    rightView.layer.cornerRadius = rightView.frame.size.width/2;
    rightView.layer.borderColor = [UIColor colorWithHue:0 saturation:0 brightness:0.93 alpha:1].CGColor;
    rightView.layer.borderWidth = 1.0f;
    [rightView addTarget:self action:@selector(rightViewClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)leftViewClick: (UIButton *)sender
{
    [sender setBackgroundColor:[UIColor orangeColor]];
    colorPicker.targetView = sender;
    [rightView setBackgroundColor:[UIColor grayColor]];
}

- (void)rightViewClick: (UIButton *)sender
{
    [sender setBackgroundColor:[UIColor colorWithHue:0.3 saturation:0.9 brightness:0.6 alpha:1]];
    colorPicker.targetView = sender;
    [leftView setBackgroundColor:[UIColor grayColor]];
}

- (void)getPickerColor:(UIColor *)color formPicker:(UIView *)picker toTargetView:(UIView *)targetView
{
    [targetView setBackgroundColor:color];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
