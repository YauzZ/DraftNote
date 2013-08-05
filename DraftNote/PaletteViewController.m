//
//  PaletteViewController.m
//  DraftNote
//
//  Created by Colin Yang Hong on 13-8-5.
//  Copyright (c) 2013年 Colin Yang Hong. All rights reserved.
//

#import "PaletteViewController.h"

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapDone:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
