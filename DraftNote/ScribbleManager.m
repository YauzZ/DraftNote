//
//  ScribbleManager.m
//  DraftNote
//
//  Created by YauzZ on 13年8月24日.
//  Copyright (c) 2013年 Colin Yang Hong. All rights reserved.
//

#import "ScribbleManager.h"
#import "NSData+MD5.h"

#define ScribbleDataPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data"]
#define ScribbleThumbnailPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/thumbnails"]

static ScribbleManager *instance = nil;

@interface ScribbleManager ()

@property (nonatomic, retain) NSMutableArray *scribblesOfMD5;
@end

@implementation ScribbleManager

- (id)init
{
    self = [super init];
    if (self) {
        self.scribblesOfMD5 = [NSMutableArray array];
    }
    return self;
}

+ (ScribbleManager *)defaultScribbleMgr
{
    if (instance == nil) {
        instance = [[ScribbleManager alloc] init];
    }
    return instance;
}

- (void)SaveScribble:(Scribble *)scribble withThumbnail:(UIImage *)image
{
    NSData *data = [scribble data];
    NSString *scribblePath = [[ScribbleManager scribbleDataPath] stringByAppendingPathComponent:[data md5]];
    if ([self fileExistAtPath:scribblePath]) {
        return;
    }
    
    NSLog(@"write file to %@",scribblePath);
    [data writeToFile:scribblePath atomically:YES];
    [_scribblesOfMD5 addObject:[data md5]];
    
    NSString *thumbnailPath = [[ScribbleManager scribbleThumbnailPath] stringByAppendingPathComponent:[data md5]];
    NSData* imageData = UIImageJPEGRepresentation(image, 1.0);
    [imageData writeToFile:thumbnailPath atomically:YES];
}

- (NSArray *)Scribbles
{
    return [NSArray arrayWithArray:_scribblesOfMD5];
}

- (BOOL)fileExistAtPath:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:path];
}

+ (NSString *)scribbleDataPath
{
    // lazy create the scribble data directory
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:ScribbleDataPath])
    {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager createDirectoryAtPath:ScribbleDataPath
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:NULL];
    }
    
    return ScribbleDataPath;
}

+ (NSString *)scribbleThumbnailPath
{
    // lazy create the scribble thumbnail directory
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:ScribbleThumbnailPath])
    {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager createDirectoryAtPath:ScribbleThumbnailPath
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:NULL];
    }
    
    return ScribbleThumbnailPath;
}

@end
