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
#import "NSMutableArray+Stack.h"


static CanvasViewController *instance = nil;

@interface CanvasViewController ()
{
    NSTimeInterval lastTimeStamp;
}

@property (nonatomic, retain) UIView *currentScribbleView;

@property (nonatomic, retain) NSMutableArray *stackOfMarks;
@end

@implementation CanvasViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        

        self.stackOfMarks = [NSMutableArray array];
        
        self.currentScribbleView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 416)] autorelease];
        _currentScribbleView.backgroundColor = [UIColor clearColor];
        _currentScribbleView.layer.delegate = self;
        [self.view addSubview:_currentScribbleView];
        
        self.currentScribble = [[[Scribble alloc] init] autorelease];
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
    [_currentScribbleView.layer setNeedsDisplay];
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
    [_stackOfMarks removeAllObjects];
    [_currentScribbleView.layer setNeedsDisplay];
}

- (IBAction)tapUndo:(id)sender
{
    if (_currentScribble.parentStroke.lastChild != nil) {
        [_stackOfMarks push:_currentScribble.parentStroke.lastChild];
        [_currentScribble removeMark:_currentScribble.parentStroke.lastChild];
        [_currentScribbleView.layer setNeedsDisplay];
    }
}

- (IBAction)tapRedo:(id)sender
{
    Stroke *stroke = [_stackOfMarks pop];
    if (stroke != nil) {
        [_currentScribble.parentStroke addMark:stroke];
        [_currentScribbleView.layer setNeedsDisplay];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:_currentScribbleView];
    
    
    Dot *lastDot = [[[Dot alloc] init] autorelease];
    lastDot.location = location;
    lastDot.size = _currentScribble.size;
    lastDot.color = _currentScribble.color;
    [_currentScribble.parentStroke addMark:lastDot];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:_currentScribbleView];
    
    Stroke *lastStroke = nil;
    if (![_currentScribble.parentStroke.lastChild isKindOfClass:[Stroke class]]) {
        [_currentScribble.parentStroke removeMark:_currentScribble.parentStroke.lastChild];
        lastStroke = [[[Stroke alloc] init] autorelease];
        [_currentScribble.parentStroke addMark:lastStroke];
    } else {
        lastStroke = _currentScribble.parentStroke.lastChild;
    }
    
    lastStroke.size = _currentScribble.size;
    lastStroke.color = _currentScribble.color;
    
    
    Vertex *lastVertex = [[[Vertex alloc] init] autorelease];
    lastVertex.location = location;
    
    [lastStroke addMark:lastVertex];
    
    if (event.timestamp - lastTimeStamp > 0.01) {
        lastTimeStamp = event.timestamp;
        [_currentScribbleView.layer setNeedsDisplay];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_stackOfMarks removeAllObjects];
    [_currentScribbleView.layer setNeedsDisplay];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    [_currentScribble.parentStroke drawWithContext:ctx];
}

@end
