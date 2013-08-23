//
//  PaletteViewController.h
//  DraftNote
//
//  Created by Colin Yang Hong on 13-8-5.
//  Copyright (c) 2013年 Colin Yang Hong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaletteViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIView *palettePreview;

@property (retain, nonatomic) IBOutlet UISlider *sliderOfR;
@property (retain, nonatomic) IBOutlet UISlider *sliderOfG;
@property (retain, nonatomic) IBOutlet UISlider *sliderOfB;
@property (retain, nonatomic) IBOutlet UISlider *sliderOfSize;


- (IBAction)valueOfColorChanged;
- (IBAction)tapDone:(id)sender;
@end
