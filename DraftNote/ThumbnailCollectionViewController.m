//
//  ThumbnailCollectionViewController.m
//  DraftNote
//
//  Created by Colin Yang Hong on 13-8-27.
//  Copyright (c) 2013年 Colin Yang Hong. All rights reserved.
//

#define CellIdentifier @"ThumbnaiViewCell"

#import "ThumbnailCollectionViewController.h"
#import "ScribbleManager.h"

@interface ThumbnailCollectionViewController ()

@end

@implementation ThumbnailCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        _thumbnailCollectionView.dataSource = (id)self;
        _thumbnailCollectionView.delegate = (id)self;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_thumbnailCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapDone:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)dealloc {
    [_thumbnailCollectionView release];
    [super dealloc];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    ScribbleManager *scribbleMgr = [ScribbleManager defaultScribbleMgr];

    return [[scribbleMgr scribbles] count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor clearColor];
    UIImageView *imageView = [[[UIImageView alloc] initWithImage:[self thumbnailWithIndex:indexPath]] autorelease];
    cell.backgroundView = imageView;
    return cell;
}

- (UIImage *)thumbnailWithIndex:(NSIndexPath *)indexPath
{
    ScribbleManager *scribbleMgr = [ScribbleManager defaultScribbleMgr];
    NSString *MD5 = [[scribbleMgr scribbles] objectAtIndex:indexPath.item];
    NSString *thumbnailPath = [[ScribbleManager scribbleThumbnailPath] stringByAppendingPathComponent:MD5];
    return [UIImage imageWithData:[NSData dataWithContentsOfFile:thumbnailPath]];
}
    
@end
