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

+ (ScribbleManager *)defaultScribbleMgr;
+ (NSString *)scribbleDataPath;
+ (NSString *)scribbleThumbnailPath;

- (void)saveScribble:(Scribble *)scribble withThumbnail:(UIImage *)image;
- (Scribble *)loadScribbleWithMD5:(NSString *)md5;
- (NSArray *)scribbles;
- (NSArray *)thumbnails;

@end
