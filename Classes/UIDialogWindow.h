//
//  UIDialogWindow.h
//  ButtonImageTest
//
//  Created by yilongxie on 11-6-29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

//#import <Foundation/Foundation.h>
//
//
//@interface UIDialogWindow : NSObject {
//    
//}
//
//@end

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "Global.h"

@interface UIDialogWindow : UIWindow {
    UIView *view;
    UIView *superView;
    UIView *backgroundView;
    UIImageView *backgroundImage;
    BOOL isClose;
}

@property (nonatomic,retain) UIView *view;
@property (nonatomic,retain) UIView *superView;
@property (nonatomic,retain) UIView *backgroundView;
@property (nonatomic,retain) UIImageView *backgroundImage;

-(UIDialogWindow *)initWithView:(UIView *)aView;
-(void)show;
-(void)close;
-(void)dialogIsRemoved;

@end