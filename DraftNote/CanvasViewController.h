//
//  CanvasViewController.h
//  DraftNote
//
//  Created by Colin Yang Hong on 13-8-5.
//  Copyright (c) 2013年 Colin Yang Hong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Scribble.h"

@interface CanvasViewController : UIViewController


@property (retain, nonatomic) IBOutlet UIToolbar *toolbar;
- (IBAction)tapPalette:(id)sender;

- (IBAction)tapTrash:(id)sender;
- (IBAction)tapUndo:(id)sender;
- (IBAction)tapRedo:(id)sender;

+ (CanvasViewController *)defaultInstance;

@property (nonatomic, retain) Scribble *currentScribble;
@end
