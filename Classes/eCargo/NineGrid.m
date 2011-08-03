//
//  NineGrid.m
//  ButtonImageTest
//
//  Created by  on 11-7-5.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "NineGrid.h"

@implementation NineGrid

@synthesize lbCount;
@synthesize lbTitle;
@synthesize lbTopTitle;
@synthesize bgImageView;
@synthesize contentView;
@synthesize topImageView;
//@synthesize button;


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
    
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag) {
        case 100:{
            NSLog(@"tag 100");
        }
            break;
            
        default:
            break;
    }
    
    //[delegate doAlert];
    [delegate doList:btn.tag];
    //NSLog(@"dd");
}



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        /*
        lbTopTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
        lbTopTitle.text = @"月份";
        lbTopTitle.backgroundColor = [UIColor clearColor];
        [self addSubview:lbTopTitle];
        */
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame dataArray:(NSMutableArray *)array
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //contentView = [[UIScrollView alloc] initWithFrame:frame];
        
        /*
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 145, 109)];
        view.backgroundColor = [UIColor purpleColor];
        UIFont *baseFont = [UIFont fontWithName:@"Helvetica" size:14];
        
        lbTopTitle = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 60, 15)];
        lbTopTitle.text = @"6月";
        lbTopTitle.font = baseFont;
        lbTopTitle.backgroundColor = [UIColor clearColor];
        [view addSubview:lbTopTitle];
        [lbTopTitle release];
        //[contentView addSubview:lbTopTitle];
        //self = contentView;
        [self addSubview:view];
        [view release];
        
        view = [[UIView alloc] initWithFrame:CGRectMake(165, 10, 145, 109)];
        view.backgroundColor = [UIColor purpleColor];
        
        lbTopTitle = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 60, 15)];
        lbTopTitle.text = @"5月";
        lbTopTitle.font = baseFont;
        lbTopTitle.backgroundColor = [UIColor clearColor];
        [view addSubview:lbTopTitle];
        [lbTopTitle release];
        [self addSubview:view];
        [view release];
         */
        for (int i=0; i<6; i++) {
            [self initView:i dataArray:nil];
        }
        isDisplayFlag = false;
    }
    return self;
}

-(void)initView:(int)index  dataArray:(NSMutableArray *)array{
    
    UIView *view = [[[UIView alloc] init] autorelease];
    view.backgroundColor = [UIColor purpleColor];
    UIFont *topTitleFont = [UIFont fontWithName:@"Helvetica" size:14];
    
    isDisplayFlag = TRUE;
    
    topImageView = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 30)] autorelease];
    topImageView.backgroundColor = [UIColor cyanColor];
    topImageView.image = [UIImage imageNamed:@""];
    
    lbTopTitle = [[[UILabel alloc] initWithFrame:CGRectMake(5, 5, 60, 15)] autorelease];
    lbTopTitle.font = topTitleFont;
    lbTopTitle.backgroundColor = [UIColor clearColor];
    
    lbTitle = [[[UILabel alloc] initWithFrame:CGRectMake(10, 30, 125, 30)] autorelease];
    lbTitle.font = [UIFont fontWithName:@"Helvetica" size:25];
    lbTitle.textAlignment = UITextAlignmentCenter;
    lbTitle.backgroundColor = [UIColor clearColor];
    
    lbCount = [[[UILabel alloc] initWithFrame:CGRectMake(10, 65, 125, 25)] autorelease];
    lbCount.font = [UIFont fontWithName:@"Helvetica" size:17];
    lbCount.textAlignment = UITextAlignmentCenter;
    lbCount.backgroundColor = [UIColor clearColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //button.frame = view.frame;
    //button.backgroundColor = [UIColor greenColor];
    button.alpha = 0.5;
   
    CGRect rect;
    switch (index) {
        case 0:{
            view.frame = CGRectMake(10, 10, 145, 109);
            lbTopTitle.text = @"2011";
            lbTitle.text = @"6月";
            lbCount.text = @"共10笔";
            //rect = view.frame;
            //button.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
            button.tag =100;
        }
            break;
        case 1:{
            view.frame = CGRectMake(145+10*2, 10, 145, 109);
            lbTopTitle.text = @"2011";
            lbTitle.text = @"5月";
            lbCount.text = @"共10笔";
            button.tag =99;

        }
            break;
        case 2:{
            view.frame = CGRectMake(10, 109+10*2, 145, 109);
            lbTopTitle.text = @"2011";
            lbTitle.text = @"4月";
            lbCount.text = @"共10笔";
            button.tag =98;

        }
            break;
        case 3:{
            view.frame = CGRectMake(145+10*2, 109+10*2, 145, 109);
            lbTopTitle.text = @"2011";
            lbTitle.text = @"3月";
            lbCount.text = @"共10笔";
            button.frame = view.frame;
            button.tag =97;

        }
            break;
        case 4:{
            view.frame = CGRectMake(10, 109*2+10*3, 145, 109);
            lbTopTitle.text = @"2011";
            lbTitle.text = @"2月";
            lbCount.text = @"共10笔";
            button.tag =96;

        }
            break;
        case 5:{
            view.frame = CGRectMake(145+10*2, 109*2+10*3, 145, 109);
            lbTopTitle.text = @"2011";
            lbTitle.text = @"1月";
            lbCount.text = @"共10笔";
            button.tag =95;

        }
            break;
            
        default:
            break;
    }
    if (isDisplayFlag) {
        [view addSubview:topImageView];
        [view addSubview:lbTopTitle];
    }
    [view addSubview:lbTitle];
    [view addSubview:lbCount];
    
    rect = view.frame;
    button.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);

    [button addTarget:self action:@selector(startAuth:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [view addSubview:button];

    [self addSubview:view];
    //[view release];

}
-(void)dodo{

    NSLog(@"dodo");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
