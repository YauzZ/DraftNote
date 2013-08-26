//
//  Stroke.m
//  DraftNote
//
//  Created by Colin Yang Hong on 13-8-5.
//  Copyright (c) 2013年 Colin Yang Hong. All rights reserved.
//

#import "Stroke.h"


@implementation Stroke

@synthesize location = _location;

- (id)init
{
    self = [super init];
    if (self)
    {
        self.children = [[NSMutableArray alloc] initWithCapacity:5];
    }
    return self;
}

- (void)dealloc
{
    [_color release];
    [_children release];
    [super dealloc];
}

- (void)setLocation:(CGPoint)location
{
}

- (CGPoint)location
{
    if ([_children count] > 0) {
        return [[_children objectAtIndex:0] location];
    }
    return CGPointZero;
}

- (void)drawWithContext:(CGContextRef)context
{
    CGContextMoveToPoint(context, self.location.x, self.location.y);
    
    for (id <Mark> mark in _children) {
        [mark drawWithContext:context];
    }
    
    CGContextSetLineWidth(context, _size); // 设置线宽
    CGContextSetLineCap(context, kCGLineCapRound); // 设置线条端点样式
    CGContextSetStrokeColorWithColor(context, [_color CGColor]); // 设置线条颜色
    CGContextStrokePath(context); // 绘制线条
}

- (void)addMark:(id<Mark>)mark
{
    if (mark != nil) {
        [_children addObject:mark];
    }
}

- (void)removeMark:(id<Mark>)mark
{
    if ([_children containsObject:mark]) {
        [_children removeObject:mark];
    } else {
        [_children makeObjectsPerformSelector:@selector(removeMark:) withObject:mark];
    }
}

- (id <Mark>)childMarkAtIndex:(NSUInteger)index
{
    if (index >= [_children count]) {
        return nil;
    }
    
    return [_children objectAtIndex:index];
}

- (id <Mark>)lastChild
{
    return [_children lastObject];
}

- (NSUInteger)count
{
    return [_children count];
}

- (id)initWithCoder:(NSCoder *)coder
{
    if (self = [super init])
    {
        _color = [[coder decodeObjectForKey:@"StrokeColor"] retain];
        _size = [coder decodeFloatForKey:@"StrokeSize"];
        _children = [[coder decodeObjectForKey:@"StrokeChildren"] retain];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:_color forKey:@"StrokeColor"];
    [coder encodeFloat:_size forKey:@"StrokeSize"];
    [coder encodeObject:_children forKey:@"StrokeChildren"];
}

@end
