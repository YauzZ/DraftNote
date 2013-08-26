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
    CGContextAddLineToPoint(context, _location.x, _location.y);
    
}

- (id)initWithCoder:(NSCoder *)coder
{
    if (self = [super init])
    {
        _location = [(NSValue *)[coder decodeObjectForKey:@"VertexLocation"] CGPointValue];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:[NSValue valueWithCGPoint:_location] forKey:@"VertexLocation"];
}

@end