//
//  LetterComparer.m
//  ScreenSnapshot
//
//  Created by Nathan Swenson on 4/29/13.
//
//

#import "LetterComparer.h"
#import "ImageHelper.h"

using namespace cv;

@implementation LetterComparer
Mat _a;
Mat _b;
Mat _c;
Mat _d;
Mat _e;
Mat _f;
Mat _g;
Mat _h;
Mat _i;
Mat _j;
Mat _k;
Mat _l;
Mat _m;
Mat _n;
Mat _o;
Mat _p;
Mat _q;
Mat _r;
Mat _s;
Mat _t;
Mat _u;
Mat _v;
Mat _w;
Mat _x;
Mat _y;
Mat _z;

- (id) init
{
    self = [super init];
    if (!self)
    {
        return nil;
    }
    NSLog(@"Initializing!");
    _a = [self matForLetter:@"a"];
    _b = [self matForLetter:@"b"];
    _c = [self matForLetter:@"c"];
    _d = [self matForLetter:@"d"];
    _e = [self matForLetter:@"e"];
    _f = [self matForLetter:@"f"];
    _g = [self matForLetter:@"g"];
    _h = [self matForLetter:@"h"];
    _i = [self matForLetter:@"i"];
    _j = [self matForLetter:@"j"];
    _k = [self matForLetter:@"k"];
    _l = [self matForLetter:@"l"];
    _m = [self matForLetter:@"m"];
    _n = [self matForLetter:@"n"];
    _o = [self matForLetter:@"o"];
    _p = [self matForLetter:@"p"];
    _q = [self matForLetter:@"q"];
    _r = [self matForLetter:@"r"];
    _s = [self matForLetter:@"s"];
    _t = [self matForLetter:@"t"];
    _u = [self matForLetter:@"u"];
    _v = [self matForLetter:@"v"];
    _w = [self matForLetter:@"w"];
    _x = [self matForLetter:@"x"];
    _y = [self matForLetter:@"y"];
    _z = [self matForLetter:@"z"];
    NSLog(@"Initialized!");
    return self;
}

- (Mat) matForLetter:(NSString*)letter
{
    Mat matLetter = [ImageHelper cvMatFromCGImage:[[NSImage imageNamed:letter] CGImageForProposedRect:NULL context:NULL hints:NULL]];
    Mat returnMat;
    vector<Mat> channels(3);
    // split img:
    split(matLetter, channels);
    // get the channels (dont forget they follow BGR order in OpenCV)
    Mat ch1 = channels[0];
    return ch1;
}


- (NSString*)findBestMatch:(Mat)mat
{
    double bestSoFar = 0;
    NSString *letter = nil;
    for (int i = 0; i < 26; i++)
    {
        double comp = 0;
        switch (i) {
            case 0:
                comp = [self compareImage:mat withTemplate:_a];
                break;
            case 1:
                comp = [self compareImage:mat withTemplate:_b];
                break;
            case 2:
                comp = [self compareImage:mat withTemplate:_c];
                break;
            case 3:
                comp = [self compareImage:mat withTemplate:_d];
                break;
            case 4:
                comp = [self compareImage:mat withTemplate:_e];
                break;
            case 5:
                comp = [self compareImage:mat withTemplate:_f];
                break;
            case 6:
                comp = [self compareImage:mat withTemplate:_g];
                break;
            case 7:
                comp = [self compareImage:mat withTemplate:_h];
                break;
            case 8:
                comp = [self compareImage:mat withTemplate:_i];
                break;
            case 9:
                comp = [self compareImage:mat withTemplate:_j];
                break;
            case 10:
                comp = [self compareImage:mat withTemplate:_k];
                break;
            case 11:
                comp = [self compareImage:mat withTemplate:_l];
                break;
            case 12:
                comp = [self compareImage:mat withTemplate:_m];
                break;
            case 13:
                comp = [self compareImage:mat withTemplate:_n];
                break;
            case 14:
                comp = [self compareImage:mat withTemplate:_o];
                break;
            case 15:
                comp = [self compareImage:mat withTemplate:_p];
                break;
            case 16:
                comp = [self compareImage:mat withTemplate:_q];
                break;
            case 17:
                comp = [self compareImage:mat withTemplate:_r];
                break;
            case 18:
                comp = [self compareImage:mat withTemplate:_s];
                break;
            case 19:
                comp = [self compareImage:mat withTemplate:_t];
                break;
            case 20:
                comp = [self compareImage:mat withTemplate:_u];
                break;
            case 21:
                comp = [self compareImage:mat withTemplate:_v];
                break;
            case 22:
                comp = [self compareImage:mat withTemplate:_w];
                break;
            case 23:
                comp = [self compareImage:mat withTemplate:_x];
                break;
            case 24:
                comp = [self compareImage:mat withTemplate:_y];
                break;
            case 25:
                comp = [self compareImage:mat withTemplate:_z];
                break;

                
            default:
                break;
        }
        if (comp > bestSoFar)
        {
            bestSoFar = comp;
            char charLetter = 'a' + i;
            letter = [NSString stringWithFormat:@"%c", charLetter];
        }
        
    }
    if (bestSoFar > .2)
    {
        return letter;
    }
    else
    {
        NSLog(@"I don't know!");
    }
     

    return nil;
}

- (double) compareImage:(Mat)mat withTemplate:(Mat)mat2
{
    Mat result;
    matchTemplate(mat, mat2, result, CV_TM_CCORR_NORMED);
    double minVal; double maxVal; cv::Point minLoc; cv::Point maxLoc;    
    minMaxLoc(result, &minVal, &maxVal, &minLoc, &maxLoc, Mat());
    return maxVal;
}


@end
