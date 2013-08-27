//
//  UIAlertView+Faster.m
//  DraftNote
//
//  Created by Colin Yang Hong on 13-8-27.
//  Copyright (c) 2013年 Colin Yang Hong. All rights reserved.
//

#import "UIAlertView+Faster.h"

@implementation UIAlertView (Faster)

+ (BOOL) doesAlertViewExist {
    for (UIWindow* window in [UIApplication sharedApplication].windows) {
        for (UIView* view in window.subviews) {
            BOOL alert = [view isKindOfClass:[UIAlertView class]];
            if (alert)
                return YES;
        }
    }
    return NO;
}

+ (void)alertWithTitle:(NSString *)title description:(NSString *)description
{
    dispatch_async(dispatch_get_main_queue(), ^(void){
        if ([UIAlertView doesAlertViewExist]) {
            return;
        }
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(title, @"")
                                                            message:NSLocalizedString(description, @"")
                                                           delegate:nil
                                                  cancelButtonTitle:NSLocalizedString(@"OK", @"")
                                                  otherButtonTitles:nil];
        [alertView show];
        [alertView release];
    });
}

@end
