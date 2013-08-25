//
//  Scribble.m
//  DraftNote
//
//  Created by Colin Yang Hong on 13-8-23.
//  Copyright (c) 2013年 Colin Yang Hong. All rights reserved.
//

#import "Scribble.h"


@interface Scribble ()



@end

@implementation Scribble

- (id)init
{
    self = [super init];
    if (self) {
        self.parentStroke = [[[Stroke alloc] init] autorelease];
        self.size = 5;
        self.color = [UIColor blackColor];
        

    }
    return self;
}

- (void)addMark:(id<Mark>)aMark
{
    [self willChangeValueForKey:@"mark"];
    [_parentStroke addMark:aMark];
    [self didChangeValueForKey:@"mark"];
}

- (void)removeMark:(id<Mark>)aMark
{
    [self willChangeValueForKey:@"mark"];
    [_parentStroke removeMark:aMark];
    [self didChangeValueForKey:@"mark"];
}

- (NSData *) data
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:_parentStroke];
    return data;
}

+ (Scribble *) scribbleWithData:(NSData *)data
{
    // It raises an NSInvalidArchiveOperationException if data is not a valid archive
    Scribble *newScribble = [[[Scribble alloc] init] autorelease];
    newScribble.parentStroke = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    return newScribble;
}

@end
