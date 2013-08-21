//
//  Dot.m
//  DraftNote
//
//  Created by Colin Yang Hong on 13-8-5.
//  Copyright (c) 2013年 Colin Yang Hong. All rights reserved.
//

#import "Dot.h"

@implementation Dot

- (void)dealloc
{
    [_color release];
    [super dealloc];
}

- (void)drawWithContext:(CGContextRef)context
{
    CGRect frame = CGRectMake(_location.x,
                              _location.y,
                              _size,
                              _size);
    
    CGContextSetFillColorWithColor(context, [_color CGColor]);
    CGContextFillEllipseInRect(context, frame);
}

@end
