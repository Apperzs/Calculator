//
//  calViewController.m
//  calculator
//
//  Created by Ajay Chaudhary on 9/3/13.
//  Copyright (c) 2013 Ajay Chaudhary. All rights reserved.
//

#import "calViewController.h"
#import <QuartzCore/QuartzCore.h>

#define Total_Row 6
#define Total_Column 5
#define Button_Width  55
#define Button_Height 50
#define Button_Margin 5
#define Animation_Time 0.3
@interface calViewController ()
@end

@implementation calViewController
-(UIColor*)colorWithHexString:(NSString*)hex
{
    
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString length] < 6) return [UIColor grayColor];
    
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 256.0f)
                           green:((float) g / 256.0f)
                            blue:((float) b / 256.0f)
                           alpha:1.0f];
}


- (void)viewDidLoad
{
    
    backGround=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    backGround.image=[UIImage imageNamed:@"MainScreen-iPhone.jpg"];
    backGround.userInteractionEnabled = YES;
    [self.view addSubview:backGround];
    [self button];
    
    textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 80, 300,60)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.font = [UIFont systemFontOfSize:15];
    textField.placeholder = @"enter text";
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.delegate = self;
    textField.userInteractionEnabled = YES;
    [backGround addSubview:textField];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)button
{
    for (int i=3; i<Total_Row+2; i++)
    {
        for (int j=0; j<Total_Column; j++)
        {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(Button_Margin + j * (Button_Margin + Button_Width),
                                      Button_Margin + i * (Button_Margin + Button_Height),
                                      Button_Width, Button_Height);
            
            button.tag = (i * Total_Row) + j+1;
            button.layer.cornerRadius = 5;
            button.clipsToBounds = YES;
            [[button layer] setBorderWidth:1.0f];
            [[button layer] setBorderColor:[UIColor blueColor].CGColor];
            button.layer.shadowColor = button.backgroundColor.CGColor;
            button.layer.shadowOpacity = 0.8;
            button.layer.shadowRadius = 1;
            button.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
            button.layer.masksToBounds = NO;
            button.backgroundColor = [self colorWithHexString:[NSString stringWithFormat:@"%d",(arc4random() % 999999)]];
            [button addTarget:self action:@selector(ButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [backGround addSubview:button];
            
            
            // [buttonArray addObject:button];
        }
    }

}

-(void)ButtonPressed:(UIButton *) button {
    NSLog(@"Hello");

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
