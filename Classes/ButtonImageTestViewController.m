//
//  ButtonImageTestViewController.m
//  ButtonImageTest
//
//  Created by yilongxie on 11-6-28.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ButtonImageTestViewController.h"
#import "UIDialogWindow.h"
#import "InfoViewController.h"
#import "DACellHViewController.h"
#import "CusPageControlViewController.h"
#import "OrderListViewController.h"
#import "ScrollViewController.h"

@implementation ButtonImageTestViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"git test ttt");
        
    UIImage *smallImage = [UIImage imageNamed:@"bubble2.jpg"];
    //self.view.backgroundColor = [UIColor colorWithPatternImage:smallImage];  
    [smallImage release]; 
	
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 100, 30)];
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:17.0];

    lb.font = font;
    lb.text = @"测试哈哈";
    [lb setAdjustsFontSizeToFitWidth:YES];
    [self.view addSubview:lb];
    [lb release];
    
    
	UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
	[btn1 setFrame:CGRectMake(20, 50, 44*3, 31*3)];
	[btn1 setBackgroundColor:[UIColor clearColor]];
	[btn1 setTitle:@"哈哈哈哈哈" forState:UIControlStateNormal];
	[btn1 setBackgroundImage:[[UIImage imageNamed:@"bubble2.jpg"] stretchableImageWithLeftCapWidth:15 topCapHeight:13] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(doTest) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:btn1];
	
	[UIColor lightTextColor];
    
    
    UIDatePicker *pp = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 250, 320, 216)];
    
    NSArray *array = pp.subviews;
    //[self.view addSubview:pp];
    NSLog(@"array count %d",[array count]);

    picker = [[MyPicker alloc] initWithFrame:CGRectMake(0, 250, 320, 216)];
    picker.dataSource = self;
    picker.delegate = self;
    [self.view addSubview:picker];
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    [arr addObject:@"1"];
    [arr addObject:@"2"];
    [arr addObject:@"3"];
    [arr removeObjectAtIndex:1];
    NSLog(@"%@",[arr description]);
    
    //[self  doAlert];
    
}

-(void)doTest{

    NSLog(@"test");
    
//    <span style="font-size: 14px;">infoViewController=[[InfoViewController alloc] init];
//    dialog=[[UIDialogWindow alloc]initWithView:infoViewController.view];
//    [infoViewController setDelegate:self onClick:@selector(startAuth:)];
//    [dialog show];</span>

    //dialog = [[UIDialogWindow alloc] initWithView:self.view];
    
    infoViewController=[[InfoViewController alloc] init]; 

    infoViewController.view.backgroundColor = [UIColor grayColor];
    dialog=[[UIDialogWindow alloc]initWithView:infoViewController.view];
    [infoViewController setDelegate:self onClick:@selector(startAuth:)];
    [[infoViewController  textView] setText:@"您确定要把我关掉么？？,我还不想哈哈哈哈哈哈哈十分大发放"];
    [dialog show];
    
}

-(void)doAlert{
    NSLog(@"啊，出错了");
    //[dialog close];

    [dialog dialogIsRemoved];
    
    CusPageControlViewController *cusVc = [[CusPageControlViewController alloc] init];
    DACellHViewController *dacellhVc = [[DACellHViewController alloc] init];
    ScrollViewController *scrollVc = [[ScrollViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:scrollVc];
    //[self presentModalViewController:nav animated:YES];
    
    [self presentModalViewController:nav animated:YES];
    [nav release];
    [dacellhVc release];
    [cusVc release];
    [scrollVc release];
    
}

-(IBAction)doCall:(id)sender{
    NSLog(@"doCall");
    
    NSString *num = [[NSString alloc] initWithFormat:@"tel://%@",@"1368173959"]; //number为号码字符串    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num]]; //拨号 
}

-(IBAction)doMsg:(id)sender{

    [self sendsms:@"test"];
    
}

-(IBAction)doStart:(id)sender{

    NSLog(@"doStart");
    OrderListViewController *orderListVc = [[OrderListViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:orderListVc];
    [self presentModalViewController:nav animated:YES];
    [orderListVc release];
    [nav release];
    

}



#pragma mark -
#pragma mark picker 数据源方法
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return  2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return  2;
}



#pragma mark -
#pragma mark picker 委托方法

//官方的意思是，指定组件中的指定数据，我理解的就是目前选中的是哪一行。
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row
            forComponent:(NSInteger)component{
    
//    if (component == PickerOne) {
//        return [self.city objectAtIndex:row];
//    }
//    return [self.zips objectAtIndex:row];
    return @"haha";
    
   
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil]; 
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];

}

/*
-(void) keyboardWillShow:(NSNotification *)note {
    
    CGRect keyboardBounds;
    [[note.userInfo valueForKey:UIKeyboardBoundsUserInfoKey] getValue: &keyboardBounds]; 
    
    keyboardHeight = keyboardBounds.size.height; 
    
    if (keyboardIsShowing == NO) {
        
        keyboardIsShowing = YES; 
        CGRect frame = self.view.frame; 
        frame.size.height -= keyboardHeight; 
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES]; 
        [UIView setAnimationDuration:0.3f]; 
        self.view.frame = frame;
        [UIView commitAnimations]; 
    }
}

- (void) textFieldDidBeginEditing:(UITextField *)textField { 
    CGRect frame = textField.frame; 
    CGFloat rowHeight = self.tableView.rowHeight;
    if (textField == textFields[CELL_FIELD_ONE]) {
        
        frame.origin.y += rowHeight * CELL_FIELD_ONE;
        
    } else if (textField == textFields[CELL_FIELD_TWO]) { 
        
        frame.origin.y += rowHeight * CELL_FIELD_TWO; 
    } else if (textField == textFields[CELL_FIELD_THREE]) {
        
        frame.origin.y += rowHeight * CELL_FIELD_THREE;
        
    } else if (textField ==TextField的[CELL_FIELD_FOUR]）{
        
        frame.origin.y + = rowHeight * CELL_FIELD_FOUR;
    } 
               
               CGFloat viewHeight = self.tableView.frame.size.height;
               
               CGFloat halfHeight = viewHeight / 2;
               CGFloat halfh= frame.origin.y +（textField.frame.size.height / 2);
               if(halfh<halfHeight){
                   frame.origin.y = 0; 
                   frame.size.height =halfh;
               }else{
                   frame.origin.y =halfh; 
                   frame.size.height =halfh;
               } 
    [self.tableView scrollRectToVisible:frame animated:YES ];
               
}*/
      

- (void) textFieldDidBeginEditing:(UITextField *)textField {
    
    //这里要看textField 是直接加到cell 上的还是加的   cell.contentView上的
 
    //直接加到cell 上
    //UITableViewCell *cell = (UITableViewCell*) [[textField superview] superview]; 
    //UITableViewCell *cell = (UITableViewCell*) [textField superview]; 

    //[tView scrollToRowAtIndexPath:[tView indexPathForCell:cell] atScrollPosition:UITableViewScrollPositionTop animated:YES]; 
}




//当选取器的行发生改变的时候调用这个方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component{
    
//    //如果第一个滚轮发生改变，开始一下方法。
//    if (component == PickerOne) {
//        //选中了哪个城市
//        NSString *selectedCity = [self.city objectAtIndex:row];
//        //在字典里找到对应的邮编
//        NSArray *array = [zidian objectForKey:selectedCity];
//        //分配给zips
//        self.zips = array;
//        //右侧的邮编，默认停留在第一行，0表示第一行。
//        [picker selectRow:0 inComponent:PickerTwo animated:YES];
//        //重新加载第二个滚轮。
//        [picker reloadComponent:PickerTwo];
//    }
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

#pragma mark -
#pragma mark MFMessageComposeViewController
- (void) alertWithTitle:(NSString *)title msg:(NSString *)msg {
    UIAlertView*alert = [[UIAlertView alloc] initWithTitle:title
                                                   message:msg 
                                                  delegate:nil 
                                         cancelButtonTitle:@"确定" 
                                         otherButtonTitles:nil];
    [alert show];
    [alert release];
}
                         
                         
- (void)displaySMS:(NSString *)message  {
    
    MFMessageComposeViewController *msgPicker = [[MFMessageComposeViewController alloc] init];
    msgPicker.messageComposeDelegate= self;
    msgPicker.navigationBar.tintColor= [UIColor blackColor];
    msgPicker.navigationBar.topItem.title = @"ttt";
    //[[[[controller viewControllers] lastObject] navigationItem] setTitle:@"SomethingElse"];
    //msgPicker.navigationItem.title = @"测试";
    
    msgPicker.body = message; // 默认信息内容
    // 默认收件人(可多个)
    //picker.recipients = [NSArray arrayWithObject:@"12345678901", nil];
    [self presentModalViewController:msgPicker animated:YES];
    [msgPicker release];
}

- (void)sendsms:(NSString *)message {
    
    Class messageClass = (NSClassFromString(@"MFMessageComposeViewController"));
    NSLog(@"can send SMS [%d]", [messageClass canSendText]);
    
    if (messageClass != nil) {
        if ([messageClass canSendText]) {
            [self displaySMS:message];
        } else {
            [self alertWithTitle:nil msg:@"设备没有短信功能"];
        }
    } else {
        [self alertWithTitle:nil msg:@"iOS版本过低，iOS4.0以上才支持程序内发送短信"];
    }
    
}


- (void)messageComposeViewController:(MFMessageComposeViewController *)controller 
                 didFinishWithResult:(MessageComposeResult)result {
    NSString*msg;
    
    switch (result) {
        case MessageComposeResultCancelled:
            msg = @"发送取消";
            break;
        case MessageComposeResultSent:
            msg = @"发送成功";
            [self alertWithTitle:nil msg:msg];
            break;
        case MessageComposeResultFailed:
            msg = @"发送失败";
            [self alertWithTitle:nil msg:msg];
            break;
        default:
            break;
    }
    
    NSLog(@"发送结果：%@", msg);
    
    [self dismissModalViewControllerAnimated:YES]; 
}

/*
- (IBAction)sendSMS {
    
    BOOL canSendSMS = [MFMessageComposeViewController canSendText];
    NSLog(@"can send SMS [%d]", canSendSMS);    
    if (canSendSMS) {
        
        MFMessageComposeViewController *picker = [[MFMessageComposeViewController alloc] init];
        picker.messageComposeDelegate = self;
        picker.navigationBar.tintColor = [UIColor blackColor];
        picker.body = @"test";
        picker.recipients = [NSArray arrayWithObject:@"186-0123-0123"];
        [self presentModalViewController:picker animated:YES];
        [picker release];        
    }    
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    
    // Notifies users about errors associated with the interface
    switch (result) {
        case MessageComposeResultCancelled:
            if (DEBUG) NSLog(@"Result: canceled");
            break;
        case MessageComposeResultSent:
            if (DEBUG) NSLog(@"Result: Sent");
            break;
        case MessageComposeResultFailed:
            if (DEBUG) NSLog(@"Result: Failed");
            break;
        default:
            break;
    }
    [self dismissModalViewControllerAnimated:YES];    
}*/


#pragma mark -
#pragma mark MFMailComposeViewController
- (void) _alertWithTitle:(NSString *)_title_ msg:(NSString *)msg {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:_title_ 
                                                    message:msg 
                                                   delegate:nil 
                                          cancelButtonTitle:@"确定" 
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

-(void)displayComposerSheet {
    MFMailComposeViewController *mailPicker = [[MFMailComposeViewController alloc] init];
    mailPicker.mailComposeDelegate = self;
    
    [mailPicker setSubject:@"eMail主题"];
    
    // 添加发送者
    NSArray *toRecipients = [NSArray arrayWithObject:@"[email]first@example.com[/email]"];
    //NSArray *ccRecipients = [NSArray arrayWithObjects:@"[email]second@example.com[/email]", @"[email]third@example.com[/email]", nil];
    //NSArray *bccRecipients = [NSArray arrayWithObject:@"[email]fourth@example.com[/email]", nil];
    [mailPicker setToRecipients:toRecipients];
    //[picker setCcRecipients:ccRecipients];    
    //[picker setBccRecipients:bccRecipients];
    
    // 添加图片
    UIImage *addPic = [UIImage imageNamed:@"Icon.png"];
    NSData *imageData = UIImagePNGRepresentation(addPic);            // png
    // NSData *imageData = UIImageJPEGRepresentation(addPic, 1);    // jpeg
    [mailPicker addAttachmentData:imageData mimeType:@"" fileName:@"Icon.png"];
    
    NSString *emailBody = @"eMail 正文";
    [mailPicker setMessageBody:emailBody isHTML:YES];
    
    [self presentModalViewController:mailPicker animated:YES];
    [mailPicker release];
}

-(void)launchMailAppOnDevice {
    NSString *recipients = @"mailto:first@example.com&subject=my email!";
    //@"mailto:first@example.com?cc=second@example.com,[email]third@example.com[/email]&subject=my email!";
    NSString *body = @"&body=email body!";
    
    NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
    email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}

-(void)sendEMail {
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
    
    if (mailClass != nil) {
        if ([mailClass canSendMail]) {
            [self displayComposerSheet];
        } else {
            [self launchMailAppOnDevice];
        }
    } else {
        [self launchMailAppOnDevice];
    }    
}

- (void)mailComposeController:(MFMailComposeViewController *)controller 
          didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    NSString *msg;
    
    switch (result) {
        case MFMailComposeResultCancelled:
            msg = @"邮件发送取消";
            break;
        case MFMailComposeResultSaved:
            msg = @"邮件保存成功";
            [self alertWithTitle:nil msg:msg];
            break;
        case MFMailComposeResultSent:
            msg = @"邮件发送成功";
            [self alertWithTitle:nil msg:msg];
            break;
        case MFMailComposeResultFailed:
            msg = @"邮件发送失败";
            [self alertWithTitle:nil msg:msg];
            break;
        default:
            break;
    }
    
    NSLog(@"发送结果：%@", msg);
    [self dismissModalViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [infoViewController release];
    [dialog release];
    [super dealloc];
}

@end
