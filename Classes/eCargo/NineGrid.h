//
//  NineGrid.h
//  ButtonImageTest
//
//  Created by  on 11-7-5.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NineGrid : UIScrollView{

    UILabel *lbTitle;
    UILabel *lbCount;
    UILabel *lbTopTitle;
    UIImageView *topImageView;
    UIImageView *bgImageView;
    UIScrollView *contentView;
    //UIButton *button;
    Boolean isDisplayFlag;//是否显示左上角的label
    
    id delegate;
    SEL onClick;
}


@property (nonatomic, retain) UILabel *lbTitle;
@property (nonatomic, retain) UILabel *lbCount;
@property (nonatomic, retain) UILabel *lbTopTitle;
@property (nonatomic, retain) UIImageView *bgImageView;
@property (nonatomic, retain) UIScrollView *contentView;
@property (nonatomic, retain) UIImageView *topImageView;
//@property (nonatomic, retain) UIButton *button;

-(void )initView:(int)index  dataArray:(NSMutableArray *)array;
-(void)setDelegate:(id)aDelegate onClick:(SEL)aOnClick;
-(IBAction)startAuth:(id)sender;

-(void)doList:(int)indexTag;


@end
