//
//  Stroke.h
//  DraftNote
//
//  Created by Colin Yang Hong on 13-8-5.
//  Copyright (c) 2013年 Colin Yang Hong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

@interface Stroke : NSObject <Mark>

@property (nonatomic, retain) UIColor *color;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, assign) CGPoint location;

@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) id <Mark> lastChild;

@property (nonatomic, retain) NSMutableArray *children;

@end
