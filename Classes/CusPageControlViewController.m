//
//  CusPageControlViewController.m
//  ButtonImageTest
//
//  Created by yilongxie on 11-7-1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "CusPageControlViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation CusPageControlViewController

@synthesize scrView1, scrView2, pageCon;


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
    [pageCon release];
    [scrView2 release];
    [scrView1 release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor grayColor]];
    for(int i = 0; i < 9; i ++) {
        UIView *tview = [[UIView alloc] initWithFrame:CGRectMake(10 + i * 320, 10, 300, 400)];
        tview.layer.contents = (id) [UIImage imageNamed:[NSString stringWithFormat:@"LogoAnimation_0%i.png", i]].CGImage;
        [tview.layer setMasksToBounds:YES];
        tview.layer.cornerRadius = 20.0;
        tview.layer.borderWidth = 3.0;
        [scrView1 addSubview:tview];
        [tview release];
    }
    scrView1.delegate = self;
    [scrView1 setPagingEnabled:YES];
    scrView2.delegate = self;
    [scrView1 setContentSize:CGSizeMake(9 * 320, 400)];
    [scrView2 setContentSize:CGSizeMake(9 * 320, 460)];
    [scrView2 setDelegate:self];
    [scrView2 setPagingEnabled:YES];
    [scrView2 setShowsHorizontalScrollIndicator:NO];
    pageCon.numberOfPages = 9;
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //[scrView1 setContentOffset:CGPointMake(scrollView.contentOffset.x * 320 / 400, 0)];
    [pageCon setCurrentPage:(int)floor(scrollView.contentOffset.x / 320)];
}

@end
