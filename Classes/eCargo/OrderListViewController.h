//
//  OrderListViewController.h
//  ButtonImageTest
//
//  Created by  on 11-7-5.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderListViewController : UIViewController{

    UIButton *btnMonth;
    UIButton *btnDay;
    UIButton *btnWeek;
    
    //UIScrollView *contentView;
    
}

@property (nonatomic, retain) UIButton *btnMonth;
@property (nonatomic, retain) UIButton *btnDay;
@property (nonatomic, retain) UIButton *btnWeek;
//@property (nonatomic, retain) UIScrollView *contentView;


- (id)initWithFrame:(CGRect)frame dataArray:(NSMutableArray *)array;

@end
