//
//  InfoViewController.h
//  ButtonImageTest
//
//  Created by yilongxie on 11-6-29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

//#import <UIKit/UIKit.h>
//
//
//@interface InfoViewController : UIViewController {
//    
//}
//
//@end


#import <UIKit/UIKit.h>
#import "Global.h"

@interface InfoViewController : UIViewController {
    id delegate;
    SEL onClick;
    IBOutlet UITextView *textView;
    IBOutlet UIButton *startBtn;
}

@property (nonatomic,retain)IBOutlet UITextView *textView;
@property (nonatomic,retain)IBOutlet UIButton *startBtn;

-(void)setDelegate:(id)aDelegate onClick:(SEL)aOnClick;

-(IBAction)startAuth:(id)sender;
-(void)doAlert;


@end