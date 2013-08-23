//
//  CanvasViewController.m
//  DraftNote
//
//  Created by Colin Yang Hong on 13-8-5.
//  Copyright (c) 2013年 Colin Yang Hong. All rights reserved.
//

#import "CanvasViewController.h"
#import "PaletteViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "Dot.h"
#import "Vertex.h"
#import "Stroke.h"

static CanvasViewController *instance = nil;

@interface CanvasViewController ()
{
    NSTimeInterval lastTimeStamp;
}

@property (nonatomic, retain) UIView *testview;

@property (nonatomic, retain) Stroke *firstStroke;

@end

@implementation CanvasViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.size = 5;
        self.color = [UIColor blackColor];
        
        self.firstStroke = [[[Stroke alloc] init] autorelease];
        
        self.testview = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 416)] autorelease];
        _testview.backgroundColor = [UIColor clearColor];
        _testview.layer.delegate = self;
        [self.view addSubview:_testview];
    }
    return self;
}

+ (CanvasViewController *)defaultInstance
{
    if (instance == nil) {
        instance = [[[CanvasViewController alloc] initWithNibName:@"CanvasViewController" bundle:[NSBundle mainBundle]] autorelease];
    }
    return instance;
}

- (void)dealloc {
    [_toolbar release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    [_testview.layer setNeedsDisplay];
}


- (void)viewDidDisappear:(BOOL)animated
{
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)tapPalette:(id)sender
{
    PaletteViewController *paletteViewController = [[[PaletteViewController alloc] init] autorelease];
    [self.navigationController pushViewController:paletteViewController animated:YES];
}

- (IBAction)tapTrash:(id)sender
{
    self.firstStroke = [[[Stroke alloc] init] autorelease];
    [_testview.layer setNeedsDisplay];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:_testview];
    
    
    Dot *lastDot = [[[Dot alloc] init] autorelease];
    lastDot.location = location;
    lastDot.size = _size;
    lastDot.color = _color;
    [_firstStroke addMark:lastDot];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:_testview];
    
    Stroke *lastStroke = nil;
    if (![_firstStroke.lastChild isKindOfClass:[Stroke class]]) {
        [_firstStroke removeMark:_firstStroke.lastChild];
        lastStroke = [[[Stroke alloc] init] autorelease];
        [_firstStroke addMark:lastStroke];
    } else {
        lastStroke = _firstStroke.lastChild;
    }
    
    lastStroke.size = _size;
    lastStroke.color = _color;
    
    
    Vertex *lastVertex = [[[Vertex alloc] init] autorelease];
    lastVertex.location = location;
    
    [lastStroke addMark:lastVertex];
    
    if (event.timestamp - lastTimeStamp > 0.01) {
        lastTimeStamp = event.timestamp;
        [_testview.layer setNeedsDisplay];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_testview.layer setNeedsDisplay];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    [_firstStroke drawWithContext:ctx];
}

@end
