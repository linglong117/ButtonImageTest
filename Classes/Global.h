//
//  Global.h
//  ButtonImageTest
//
//  Created by yilongxie on 11-6-29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Global : NSObject {
    
}

+(UIImage *) pngWithPath:(NSString *)path;
+(NSString *) dateInFormat: (time_t)dateTime format:(NSString*) stringFormat;

@end
