//
//  SplashScreen.m
//  calculator
//
//  Created by Harry on 9/12/13.
//  Copyright (c) 2013 Ajay Chaudhary. All rights reserved.
//

#import "SplashScreen.h"

@interface SplashScreen ()

@end

@implementation SplashScreen

@synthesize mainView;
@synthesize firstView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    mainView = [[UIImageView alloc]init];
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    if (UIUserInterfaceIdiomPhone == UI_USER_INTERFACE_IDIOM()) {
        if (screenSize.height == 480) {
            mainView.frame = CGRectMake(0, 0, 320, 480);
        } else if (screenSize.height == 568) {
            mainView.frame = CGRectMake(0, 0, 320, 568);
        }
    }
    else {
        mainView.frame = CGRectMake(0, 0, 1024, 768);
    }
    [self done];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)done {
    
    mainView.animationImages=[NSArray arrayWithObjects:
                              [UIImage imageNamed:@"Splash-iPhone.jpg"],
                              //                              [UIImage imageNamed:@"star-2.png"],
                              //                              [UIImage imageNamed:@"star-3.png"],
                              //                              [UIImage imageNamed:@"star-4.png"],
                              //                              [UIImage imageNamed:@"star-5.png"],
                              //                              [UIImage imageNamed:@"star-6.png"],
                              //                              [UIImage imageNamed:@"star-7.png"],
                              //                              [UIImage imageNamed:@"star-8.png"],
                              //                              [UIImage imageNamed:@"star-9.png"],
                              //                              [UIImage imageNamed:@"star-10.png"],q
                              //                              [UIImage imageNamed:@"star-11.png"],
                              //                              [UIImage imageNamed:@"star-12.png"],
                              //                              [UIImage imageNamed:@"star-13.png"],
                              //                              [UIImage imageNamed:@"star-14.png"],
                              //                              [UIImage imageNamed:@"star-15.png"],
                              //                              [UIImage imageNamed:@"star-16.png"],
                              //                              [UIImage imageNamed:@"star-17.png"],
                              //                              [UIImage imageNamed:@"star-18.png"],
                              //                              [UIImage imageNamed:@"star-19.png"],
                              nil];
    
    [self.view addSubview:mainView];
    
    if(![ mainView isAnimating])
    {
        mainView.animationDuration=2.0;
        [mainView startAnimating];
    }
    [self performSelector:@selector(goToNextScreen) withObject:nil afterDelay:3];
    [self performSelector:@selector(ImageAnimationStop) withObject:nil afterDelay:3.5];
}


-(void)ImageAnimationStop { 
    [mainView stopAnimating];
}

-(void)goToNextScreen {
    [self performSegueWithIdentifier:@"goToNextScreen" sender:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
