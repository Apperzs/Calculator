//
//  SplashScreen.h
//  calculator
//
//  Created by Harry on 9/12/13.
//  Copyright (c) 2013 Ajay Chaudhary. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CenterPoints_iPhone CGPointMake(240.0, 160.0)
#define CenterPoints_iPad   CGPointMake(512.0, 374.0)

#define viewWidth_iPhone  480.0                                 // in LandScappeMode For iPhone
#define viewHeight_iPhone 320.0                                //in LanscapeMode
#define ImageViewInitialPoint_iPhone CGPointMake(240.0, 276.0)
#define ImageViewInitialSize_iPhone CGSizeMake(50.0, 50.0)

#define viewWidth_iPad  1024.0
#define viewHeight_iPad 748.0                                //in LanscapeMode  for iPad
#define ImageViewInitialPoint_iPad CGPointMake(512.0, 692.0)
#define ImageViewInitialSize_iPad CGSizeMake(100.0, 100.0)


@interface SplashScreen : UIViewController {
    UIImageView *mainView;
    UIImageView *firstView;

}

@property (strong, nonatomic)UIImageView *mainView;
@property (strong, nonatomic)UIImageView *firstView;

@end
