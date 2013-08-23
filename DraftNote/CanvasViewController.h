//
//  CanvasViewController.h
//  DraftNote
//
//  Created by Colin Yang Hong on 13-8-5.
//  Copyright (c) 2013年 Colin Yang Hong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CanvasViewController : UIViewController

@property (nonatomic, retain) UIColor *color;
@property (nonatomic, assign) CGFloat size;


@property (retain, nonatomic) IBOutlet UIToolbar *toolbar;
- (IBAction)tapPalette:(id)sender;

- (IBAction)tapTrash:(id)sender;

+ (CanvasViewController *)defaultInstance;
@end
