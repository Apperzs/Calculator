//
//  calViewController.h
//  calculator
//
//  Created by Ajay Chaudhary on 9/3/13.
//  Copyright (c) 2013 Ajay Chaudhary. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface calViewController : UIViewController<UITextFieldDelegate>
{
    UIImageView *mainView;
    UIImageView *headerView;
    UITextField *textField;
    UIImageView *buttonBackGround;
    UIImageView *footerView;
    UIView * iAdd;
    
}

@end
