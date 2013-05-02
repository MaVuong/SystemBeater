//
//  KeyboardHelper.h
//  ScreenSnapshot
//
//  Created by Nathan Swenson on 4/28/13.
//
//

#import <Foundation/Foundation.h>

@interface KeyboardHelper : NSObject

+ (NSString *)keyStringFormKeyCode:(CGKeyCode)keyCode;
+ (CGKeyCode)keyCodeFormKeyString:(NSString *)keyString;


@end
