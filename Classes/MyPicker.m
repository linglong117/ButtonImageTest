//
//  MyPicker.m
//  PickerSkinTest
//
//  Created by Wang WenHui on 10-5-3.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MyPicker.h"


@implementation MyPicker


- (id)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        // Initialization code
		
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
	UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 234)];
	img.image = [UIImage imageNamed:@"bubble2.jpg"];
    img.alpha = 0.3;
	//[self addSubview:img];
    //[self sendSubviewToBack:img];
	[img release];
    
    NSString *fileLocation = [[NSBundle mainBundle] pathForResource:@"bubble2" ofType:@"jpg"]; 
//    NSData *imageData = [NSData dataWithContentsOfFile:fileLocation]; 
//    UIImage *image = [UIImage imageWithData:imageData];
    
    UIImage *smallImage = [[UIImage alloc] initWithContentsOfFile:fileLocation]; 
    smallImage = [UIImage imageNamed:@"bubble2.jpg"];
    self.backgroundColor = [UIColor colorWithPatternImage:smallImage];  
    [smallImage release]; 
    
//    [[UIImage imageNamed:@"bubble2.jpg"] drawInRect:rect];
	
	//4-选择区域的背景颜色; 0-大背景的颜色; 1-选择框左边的颜色; 2-? ;3-?; 5-滚动区域的颜色 回覆盖数据
	//6-选择框的背景颜色 7-选择框左边的颜色 8-整个View的颜色 会覆盖所有的图片
    
    NSArray *array = self.subviews;
    
	UIView *v = [[self subviews] objectAtIndex:1];
	[v setBackgroundColor:[UIColor clearColor]];
	UIImageView *bgimg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bubble1.jpg"]];
	bgimg.frame = CGRectMake(-5, -3, 100, 35);
	[v addSubview:bgimg];
	[bgimg release];
    
    v = [[self subviews] objectAtIndex:4];
	[v setBackgroundColor:[UIColor clearColor]];
	bgimg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bubble2.jpg"]];
	bgimg.frame = CGRectMake(-5, -3, 100, 35);
	[v addSubview:bgimg];
	[bgimg release];
    
//    v = [[self subviews] objectAtIndex:5];
//	[v setBackgroundColor:[UIColor redColor]];
//	bgimg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bubble2.jpg"]];
//	bgimg.frame = CGRectMake(-5, -3, 100, 35);
//	//[v addSubview:bgimg];
//	[bgimg release];
	
	[self setNeedsDisplay];
	
}


- (void)dealloc {
    [super dealloc];
}


@end
