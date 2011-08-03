//
//  ScrollViewController.m
//  ButtonImageTest
//
//  Created by  on 11-7-6.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "ScrollViewController.h"
#import <QuartzCore/QuartzCore.h>



@implementation ScrollViewController

@synthesize  scrollView;
@synthesize btn1;
@synthesize btn2;
@synthesize btn3;
@synthesize btn4;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    
    
    UIBarButtonItem *btnBack = [[UIBarButtonItem  alloc] initWithTitle:@"Back" 
                                                                 style:UIBarButtonItemStylePlain 
                                                                target:self 
                                                                action:@selector(doBack)];
    self.navigationItem.leftBarButtonItem = btnBack;

    [self.view setBackgroundColor:[UIColor grayColor]];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 10, 320, 300)];
    
    for(int i = 1; i < 5; i ++) {
        /*
        UIView *tview = [[UIView alloc] initWithFrame:CGRectMake(10 + i * 320, 10, 300, 280)];
        tview.layer.contents = (id) [UIImage imageNamed:[NSString stringWithFormat:@"LogoAnimation_0%i.png", i]].CGImage;
        [tview.layer setMasksToBounds:YES];
        tview.layer.cornerRadius = 20.0;
        tview.layer.borderWidth = 3.0;
        [scrollView addSubview:tview];
        [tview release];
        */
        UIButton *btn = [UIButton  buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(10 + (i-1) * 320, 10, 300, 280);
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"LogoAnimation_0%i.png", i]] forState:UIControlStateNormal];
        btn.tag = i;
        [btn addTarget:self action:@selector(doSelect:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:btn];        
    }
    scrollView.delegate = self;
    [scrollView setPagingEnabled:YES];
    scrollView.showsVerticalScrollIndicator = FALSE;
    scrollView.showsHorizontalScrollIndicator = FALSE;
    

    [scrollView setContentSize:CGSizeMake(4 * 320, 300)];
    [self.view addSubview:scrollView];
    
    btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(20, 320, 60, 30);
    //btn1.titleLabel.text = @"btn1";
    [btn1 setTitle:@"btn1" forState:UIControlStateNormal];
    btn1.tag = 100;
    [btn1 addTarget:self action:@selector(doBtnSelect:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
     
    CGRect rect;
    rect = btn1.frame;
    
    btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    rect.origin.x += rect.size.width +10;
    btn2.frame = rect;
    [btn2 setTitle:@"btn2" forState:UIControlStateNormal];
    btn2.tag = 99;
    [btn2 addTarget:self action:@selector(doBtnSelect:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];

    
    rect = btn2.frame;
    btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    rect.origin.x += rect.size.width +10;
    btn3.frame = rect;
    [btn3 setTitle:@"btn3" forState:UIControlStateNormal];
    btn3.tag = 98;
    [btn3 addTarget:self action:@selector(doBtnSelect:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];

    
    rect = btn3.frame;
    btn4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    rect.origin.x += rect.size.width +10;
    btn4.frame = rect;
    [btn4 setTitle:@"btn4" forState:UIControlStateNormal];
    btn4.tag = 97;
    [btn4 addTarget:self action:@selector(doBtnSelect:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn4];

}



-(void)doBack{
    
    [self dismissModalViewControllerAnimated:YES];
}

-(void)doSelect:(id)sender{

    UIButton *btn = (UIButton *)sender;
    int indexTag = btn.tag;
    switch (indexTag) {
        case 1:{
            NSLog(@"doSelect  1");
        }
            break;
        case 2:{
            NSLog(@"doSelect  2");
        }
            break;
        case 3:{
            NSLog(@"doSelect  3");
            
        }
            break;
        case 4:{
            NSLog(@"doSelect  4");
            
        }
            break;
            
        default:
            break;
    }
}

-(void)doBtnSelect:(id)sender{
    
    UIButton *btn = (UIButton *)sender;
    int indexTag = btn.tag;
    switch (indexTag) {
        case 100:{
            NSLog(@"doSelect  1");
            
            //[self.scrollView.delegate scrollViewDidScroll:scrollView]; 
            [scrollView setContentOffset:(CGPoint)CGPointMake(0,0) animated:YES];

        }
            break;
        case 99:{
            NSLog(@"doSelect  2");
            [scrollView setContentOffset:(CGPoint)CGPointMake(320,0) animated:YES];

        }
            break;
        case 98:{
            NSLog(@"doSelect  3");
            [scrollView setContentOffset:(CGPoint)CGPointMake(320*2,0) animated:YES];

            
        }
            break;
        case 97:{
            NSLog(@"doSelect  4");
            [scrollView setContentOffset:(CGPoint)CGPointMake(320*3,0) animated:YES];

            
        }
            break;
            
        default:
            break;
    }
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



#pragma mark -
#pragma mark UIScrollViewDelegate

//- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
//} 

//- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
//    NSLog(@"scrollViewDidEndScrollingAnimation");
//}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    //CGPoint offset = scrollView.contentOffset;
   // [scrollView setContentOffset:offset animated:NO];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //[scrView1 setContentOffset:CGPointMake(scrollView.contentOffset.x * 320 / 400, 0)];
    //[pageCon setCurrentPage:(int)floor(scrollView.contentOffset.x / 320)];
    //[scrollView setContentOffset:(CGPoint)contentOffset animated:YES];
    

    
    NSLog(@"scrollViewDidScroll");
}


@end
