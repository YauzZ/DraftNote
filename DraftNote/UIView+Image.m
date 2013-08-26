//
//  UIView+Image.m
//  DraftNote
//
//  Created by Colin Yang Hong on 13-8-26.
//  Copyright (c) 2013年 Colin Yang Hong. All rights reserved.
//

#import "UIView+Image.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (Image)

- (UIImage *)renderToImage
{
    // IMPORTANT: using weak link on UIKit
    if(UIGraphicsBeginImageContextWithOptions != NULL)
    {
        UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
    } else {
        UIGraphicsBeginImageContext(self.frame.size);
    }
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
