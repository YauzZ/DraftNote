//
//  Scribble.h
//  DraftNote
//
//  Created by Colin Yang Hong on 13-8-23.
//  Copyright (c) 2013年 Colin Yang Hong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stroke.h"

@interface Scribble : NSObject

@property (nonatomic, retain) UIColor *color;
@property (nonatomic, assign) CGFloat size;

@property (nonatomic, retain) Stroke *parentStroke;

// methods for Mark management
- (void) addMark:(id <Mark>)aMark;
- (void) removeMark:(id <Mark>)aMark;

+ (Scribble *) scribbleWithData:(NSData *)data;
- (NSData *) data;

@end
