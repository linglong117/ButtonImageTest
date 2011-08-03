//
//  OrderListViewController.m
//  ButtonImageTest
//
//  Created by  on 11-7-5.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "OrderListViewController.h"
#import "NineGrid.h"


@implementation OrderListViewController


@synthesize btnDay;
@synthesize btnMonth;
@synthesize btnWeek;

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
    
    
    NineGrid *ngView = [[NineGrid alloc] initWithFrame:CGRectMake(0, 0, 320, 420) dataArray:nil];
    [ngView setDelegate:self onClick:@selector(startAuth:)];

    ngView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:ngView];
    
}



-(void)doList:(int)indexTag{
    
    switch (indexTag) {
        case 100:{
            NSLog(@"tag 100");
        }
            break;
        case 99:{
            NSLog(@"tag 99");
        }
            break;
        case 98:{
            NSLog(@"tag 98");
        }
            break;
        case 97:{
            NSLog(@"tag 97");
        }
            break;
        case 96:{
            NSLog(@"tag 96");
        }
            break;
        case 95:{
            NSLog(@"tag 95");
        }
            break;
        default:
            break;
    }


}




-(void)doBack{

    [self dismissModalViewControllerAnimated:YES];
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
