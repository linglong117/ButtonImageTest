//
//  InfoViewController.m
//  ButtonImageTest
//
//  Created by yilongxie on 11-6-29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "InfoViewController.h"
#import "ButtonImageTestAppDelegate.h"

@implementation InfoViewController

@synthesize textView;
@synthesize startBtn;


-(void)setDelegate:(id)aDelegate onClick:(SEL)aOnClick
{
    delegate = aDelegate;
    //onClick = aOnClick;
    onClick = @selector(startAuth:);
    NSLog(@"dfasdf");

}


-(IBAction)startAuth:(id)sender
{
//    if (delegate) {
//        [delegate performSelector:onClick withObject:@"start"];
//        //[delegate performSelector:onClick withObject:@"start"] ;
//
//    } 
    if([delegate respondsToSelector:@selector(startAuth:)]) 
    {
        [delegate performSelector:@selector(startAuth:)]; 
    }
    
    [delegate doAlert];
    NSLog(@"dd");
    
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [textView release];
    [startBtn release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor clearColor];
    //[self.navigationController setNavigationBarHidden:YES];
//    [[ButtonImageTestAppDelegate sharedApplication] setStatusBarHidden:YES animated:NO];
    //[[UIApplication sharedApplication] setStatusBarHidden:YES animated:NO];
    //[[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:NO];
     
   // [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    
    textView.font=[UIFont systemFontOfSize:15];
    textView.editable = NO;
    
//    [startBtn setBackgroundImage:[[Global pngWithPath:@"btn_h_bg"] stretchableImageWithLeftCapWidth:12.0 topCapHeight:14.0] forState:UIControlStateNormal];
//    [startBtn setBackgroundImage:[[Global pngWithPath:@"btn_h_bg"] stretchableImageWithLeftCapWidth:12.0 topCapHeight:14.0] forState:UIControlStateHighlighted];
    
    [startBtn setBackgroundImage:[[UIImage imageNamed:@"bubble1.jpg"] stretchableImageWithLeftCapWidth:15 topCapHeight:13.0] forState:UIControlStateNormal];
    [startBtn setBackgroundImage:[[UIImage imageNamed:@"bubble2.jpg"] stretchableImageWithLeftCapWidth:12.0 topCapHeight:14.0] forState:UIControlStateHighlighted];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
