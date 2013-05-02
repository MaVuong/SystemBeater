//
//  ImageHelper.h
//  ScreenSnapshot
//
//  Created by Nathan Swenson on 4/29/13.
//
//

#import <Foundation/Foundation.h>
#include <opencv2/opencv.hpp>

@interface ImageHelper : NSObject
+ (cv::Mat)cvMatFromCGImage:(CGImageRef)image;
+ (CGImageRef)CGImageFromCVMat:(cv::Mat)cvMat;
@end
