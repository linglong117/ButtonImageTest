//
//  CusPageControlViewController.h
//  ButtonImageTest
//
//  Created by yilongxie on 11-7-1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CusPageControlViewController : UIViewController<UIScrollViewDelegate> {
    UIScrollView *scrView1;
    UIScrollView *scrView2;
    UIPageControl *pageCon;
}
@property (nonatomic, retain) IBOutlet UIScrollView *scrView1;
@property (nonatomic, retain) IBOutlet UIScrollView *scrView2;
@property (nonatomic, retain) IBOutlet UIPageControl *pageCon;

@end