//
//  UIDialogWindow.m
//  ButtonImageTest
//
//  Created by yilongxie on 11-6-29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "UIDialogWindow.h"


@implementation UIDialogWindow


@synthesize view;
@synthesize backgroundView;
@synthesize superView;
@synthesize backgroundImage;


-(UIDialogWindow *)initWithView:(UIView *)aView
{
    if (self==[super init]) {
        //内容view
        self.view=aView;
        
        [self setFrame:[[UIScreen mainScreen]bounds]];
        self.windowLevel=UIWindowLevelStatusBar;
        self.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
        
        //根view
        UIView *sv=[[UIView alloc] initWithFrame:[self bounds]];
        self.superView=sv;
        [superView setAlpha:0.0f];
        [self addSubview:superView];
        [sv release];
        
        CGFloat d=-7.0f;
        UIView *bv=[[UIView alloc] initWithFrame:CGRectInset(CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height),d,d)];
        self.backgroundView=bv;
        
        //圆角图片背景view
        UIImageView *bi=[[UIImageView alloc] initWithImage:[[Global pngWithPath:@"dialog_bg2"]stretchableImageWithLeftCapWidth:13.0 topCapHeight:9.0]];
        self.backgroundImage=bi;
        [backgroundImage setFrame:[backgroundView bounds]];
        [backgroundView insertSubview:backgroundImage atIndex:0];
        [backgroundView setCenter:CGPointMake(superView.bounds.size.width/2, superView.bounds.size.height/2)];
        [superView addSubview:backgroundView];
        
        CGRect frame=CGRectInset([backgroundView bounds], -1*d, -1*d);
        //显示内容view
        [backgroundView addSubview:self.view];
        [self.view setFrame:frame];
        isClose=NO;
        [bv release];
        [bi release];
    }
    return self;
}

//显示弹出窗口
-(void)show
{
    [self makeKeyAndVisible];
    [superView setAlpha:1.0f]; 
}


-(void)dialogIsRemoved
{
    isClose=YES;
    [view removeFromSuperview];
    view=nil;
    [backgroundView removeFromSuperview];
    backgroundView=nil;
    [superView removeFromSuperview];
    superView=nil;
    [self setAlpha:0.0f];
    [self removeFromSuperview];
    self=nil;
    
}

-(void)close
{
    [UIView setAnimationDidStopSelector:@selector(dialogIsRemoved)];
    [superView setAlpha:0.0f];
}

@end