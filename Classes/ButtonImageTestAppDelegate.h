//
//  ButtonImageTestAppDelegate.h
//  ButtonImageTest
//
//  Created by yilongxie on 11-6-28.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ButtonImageTestViewController;

@interface ButtonImageTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ButtonImageTestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ButtonImageTestViewController *viewController;

@end

