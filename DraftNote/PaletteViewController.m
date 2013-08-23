//
//  PaletteViewController.m
//  DraftNote
//
//  Created by Colin Yang Hong on 13-8-5.
//  Copyright (c) 2013年 Colin Yang Hong. All rights reserved.
//

#import "PaletteViewController.h"
#import "CanvasViewController.h"

@interface PaletteViewController ()

@end

@implementation PaletteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    CanvasViewController *viewController = [CanvasViewController defaultInstance];
    _sliderOfSize.value = viewController.currentScribble.size;
    
    float red,blue,green;
    [viewController.currentScribble.color getRed:&red green:&green blue:&blue alpha:nil];
    _sliderOfB.value = blue;
    _sliderOfR.value = red;
    _sliderOfG.value = green;
    [self valueOfColorChanged];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)valueOfColorChanged
{
    _palettePreview.backgroundColor = [UIColor colorWithRed:_sliderOfR.value green:_sliderOfG.value blue:_sliderOfB.value alpha:1.0];
}

- (IBAction)tapDone:(id)sender
{
    CanvasViewController *viewController = [CanvasViewController defaultInstance];
    viewController.currentScribble.color = [UIColor colorWithRed:_sliderOfR.value green:_sliderOfG.value blue:_sliderOfB.value alpha:1.0];
    viewController.currentScribble.size = _sliderOfSize.value;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc {
    [_sliderOfR release];
    [_sliderOfG release];
    [_sliderOfB release];
    [_palettePreview release];
    [_sliderOfSize release];
    [super dealloc];
}
@end
