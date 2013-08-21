//
//  NSMutableArray+Stack.m
//  DraftNote
//
//  Created by Colin Yang Hong on 13-8-21.
//  Copyright (c) 2013年 Colin Yang Hong. All rights reserved.
//

#import "NSMutableArray+Stack.h"

@implementation NSMutableArray (Stack)

- (void)push:(id)object
{
    [self addObject:object];
}

- (id)pop
{
    if ([self count] == 0) {
        return nil;
    }
    id object = [[[self lastObject] retain] autorelease];
    [self removeLastObject];
    return object;
}
@end
