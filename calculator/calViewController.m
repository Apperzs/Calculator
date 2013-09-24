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
#define Button_Width  58
#define Button_Height 48
#define Button_Margin 5
#define Animation_Time 0.3
@interface calViewController ()
@end

@implementation calViewController

- (void)viewDidLoad
{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    mainView=[[UIImageView alloc]init];
    headerView =[[UIImageView alloc]init];
    textField = [[UITextField alloc] init];
    middelBackGround = [[UIImageView alloc]init];
    footerView =[[UIImageView alloc]init];
    iAdd = [[UIView alloc]init];
    mainButton = [[UIButton alloc]init];
    settingButton = [[UIButton alloc]init];
    
    
    if (screenSize.height == 568) {
        mainView.frame = CGRectMake(0, 0, 320, 568);
        
        mainButton.frame = CGRectMake(0, 0, 44,44);
        mainButton.frame = CGRectMake(0, 0, 44,44);
        
        headerView.frame = CGRectMake(0, 0, 320, 49);
        textField.frame = CGRectMake(0, 49, 320 ,97.5);
        middelBackGround.frame = CGRectMake(0, 145, 320, 322);
        footerView.frame = CGRectMake(0, 468, 320, 49);
        iAdd.frame = CGRectMake(0, 517, 320, 49);
    
    } else if (screenSize.height == 480) {
        
        mainView.frame = CGRectMake(0, 0, 320, 480);
        
        mainButton.frame = CGRectMake(0, 0, 44,44);
        settingButton.frame = CGRectMake(10, 0, 44,44);
        
        headerView.frame = CGRectMake(0, 0, 320, 98/2);
        textField.frame = CGRectMake(0, 98/2, 320 ,195/2);
        middelBackGround.frame = CGRectMake(0, 195/2, 320, 847/2);
        footerView.frame = CGRectMake(0, 847/2, 320, 98/2);
        iAdd.frame = CGRectMake(0, 98/2, 320, 101/2);
    }

    mainView.backgroundColor=[UIColor colorWithRed:0.369 green:0.655 blue:0.29 alpha:1.0];
    mainView.userInteractionEnabled=YES;
    [self.view addSubview:mainView];
    
    headerView.image = [UIImage imageNamed:@"header.png"];
    headerView.userInteractionEnabled = YES;
    [mainView addSubview:headerView];
    
    mainButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [mainButton setBackgroundImage:[UIImage imageNamed:@"menu-button.png"] forState:UIControlStateNormal];
    [mainButton setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    [mainButton addTarget:self action:@selector(ButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    mainButton.userInteractionEnabled = YES;
    [headerView addSubview:mainButton];
    
    settingButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [settingButton setBackgroundImage:[UIImage imageNamed:@"settings-button.png"] forState:UIControlStateNormal];
    [settingButton setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    [settingButton addTarget:self action:@selector(ButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    settingButton.userInteractionEnabled = YES;
    [headerView addSubview:settingButton];
    
    
    textField.borderStyle = UITextBorderStyleNone;
    [textField setBackground:[UIImage imageNamed:@"calculation_bar.png"]];
    textField.font = [UIFont fontWithName:@"" size:24];
    textField.placeholder = @"enter text";
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.delegate = self;
    [mainView addSubview:textField];
    
    middelBackGround.image = [UIImage imageNamed:@"middelBackGround.png"];
    middelBackGround.userInteractionEnabled = YES;
    [mainView addSubview:middelBackGround];
    
    footerView.image = [UIImage imageNamed:@"footer.png"];
    footerView.userInteractionEnabled = YES;
    [mainView addSubview:footerView];
    
    
    [self button];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)button
{
    for (int i=0; i<Total_Row; i++)
    {
        for (int j=0; j<Total_Column; j++)
        {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.tag = (i * Total_Column) + j+1;
            if(button.tag==25)
                button.frame = CGRectMake(Button_Margin + j * (Button_Margin + Button_Width),
                                          Button_Margin + i * (Button_Margin + Button_Height)+145,
                                          Button_Width, Button_Height*2+Button_Margin);

            else
                button.frame = CGRectMake(Button_Margin + j * (Button_Margin + Button_Width),
                                      Button_Margin + i * (Button_Margin + Button_Height)+145,
                                      Button_Width, Button_Height);
            
            
            button.layer.cornerRadius = 5;
            button.clipsToBounds = YES;
            [[button layer] setBorderWidth:.3f];
            [[button layer] setBorderColor:[UIColor greenColor].CGColor];
            button.layer.shadowColor = button.backgroundColor.CGColor;
            //button.layer.shadowOpacity = 0.8;
           // button.layer.shadowRadius = 1;
           // button.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
            button.layer.masksToBounds = NO;
            [button addTarget:self action:@selector(ButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [mainView addSubview:button];
            
            if(button.tag==29)
                break;
            // [buttonArray addObject:button];
        }
    }

}

-(void)ButtonPressed:(UIButton *) button
{
    NSLog(@"Hello");
    NSLog(@"tag=%d",button.tag);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
