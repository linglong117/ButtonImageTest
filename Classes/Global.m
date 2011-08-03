//
//  Global.m
//  ButtonImageTest
//
//  Created by yilongxie on 11-6-29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Global.h"


@implementation Global

+(UIImage *) pngWithPath:(NSString *)path
{
    NSString *fileLocation = [[NSBundle mainBundle] pathForResource:path ofType:@"png"]; 
    NSData *imageData = [NSData dataWithContentsOfFile:fileLocation]; 
    UIImage *img=[UIImage imageWithData:imageData];
    return img;
}

+(NSString *) dateInFormat: (time_t)dateTime format:(NSString*) stringFormat 
{
    char buffer[80];
    const char *format = [stringFormat UTF8String];
    struct tm * timeinfo;
    timeinfo = localtime(&dateTime);
    strftime(buffer, 80, format, timeinfo);
    return [NSString  stringWithCString:buffer encoding:NSUTF8StringEncoding];
}


@end
