//
//  Vertex.m
//  DraftNote
//
//  Created by Colin Yang Hong on 13-8-5.
//  Copyright (c) 2013年 Colin Yang Hong. All rights reserved.
//

#import "Vertex.h"

@implementation Vertex

- (void)dealloc
{
    [_color release];
    [super dealloc];
}

- (void)drawWithContext:(CGContextRef)context
{
    CGContextAddLineToPoint(context, self.location.x, self.location.y);
    
}

@end