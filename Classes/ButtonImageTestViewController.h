//
//  ButtonImageTestViewController.h
//  ButtonImageTest
//
//  Created by yilongxie on 11-6-28.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIDialogWindow.h"
#import "InfoViewController.h"
#import "MyPicker.h"
//#import <telephonyui /TelephonyUI.h>
#import <MessageUI/MessageUI.h>

//@class MyPicker;

@interface ButtonImageTestViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,MFMessageComposeViewControllerDelegate,MFMailComposeViewControllerDelegate> {
    UIDialogWindow *dialog;
    InfoViewController *infoViewController;

    //UIPickerView *pickView

    MyPicker *picker;
    
    
    
}

-(IBAction)doCall:(id)sender;
-(IBAction)doMsg:(id)sender;
-(IBAction)doStart:(id)sender;

@end

