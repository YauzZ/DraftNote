//
//  ThumbnailCollectionViewController.h
//  DraftNote
//
//  Created by Colin Yang Hong on 13-8-27.
//  Copyright (c) 2013年 Colin Yang Hong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThumbnailCollectionViewController : UIViewController

@property (retain, nonatomic) IBOutlet UICollectionView *thumbnailCollectionView;
- (IBAction)tapDone:(id)sender;
@end
