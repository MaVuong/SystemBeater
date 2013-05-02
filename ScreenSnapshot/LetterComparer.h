//
//  LetterComparer.h
//  ScreenSnapshot
//
//  Created by Nathan Swenson on 4/29/13.
//
//

#import <Foundation/Foundation.h>
#include <opencv2/opencv.hpp>

@interface LetterComparer : NSObject
- (id) init;
- (NSString*)findBestMatch:(cv::Mat)mat;
- (cv::Mat) matForLetter:(NSString*)letter;
@end
