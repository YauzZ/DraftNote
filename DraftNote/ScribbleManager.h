//
//  ScribbleManager.h
//  DraftNote
//
//  Created by YauzZ on 13年8月24日.
//  Copyright (c) 2013年 Colin Yang Hong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Scribble.h"

@interface ScribbleManager : NSObject

@property (nonatomic, retain, readonly) NSMutableArray *scribblesOfMD5;

+ (ScribbleManager *)defaultScribbleMgr;
+ (NSString *)scribbleDataPath;
+ (NSString *)scribbleThumbnailPath;

- (void)SaveScribble:(Scribble *)scribble withThumbnail:(UIImage *)image;

@end
