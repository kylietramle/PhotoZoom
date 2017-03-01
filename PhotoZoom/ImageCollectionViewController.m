//
//  ImageCollectionViewController.m
//  PhotoZoom
//
//  Created by Kylie Tram Le on 1/15/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import "ImageCollectionViewController.h"
#import "ImageViewController.h"
#import "Image.h"
#import "ImageCell.h"
#import "APIResponse.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation ImageCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.apiResponse = [[APIResponse alloc] init];
    
    // KVO for API call: images array
    [self.apiResponse addObserver:self forKeyPath:@"images" options:NSKeyValueObservingOptionNew context: nil];
    
    self.navigationItem.title = @"PhotoZoom";
    [self addCollectionViewToMainView];

}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"images"]) {
        [self.collectionView reloadData];
        
        // try/catch: safe unsubscribe for kvo, in case observer is already unregistered
        @try {
            [self.apiResponse removeObserver:self forKeyPath:@"images"];
        }
        @catch (NSException * __unused exception) {}
    }
}

- (void)addCollectionViewToMainView{
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-20) collectionViewLayout:flowLayout];
    
    [self.collectionView setBackgroundColor:[UIColor blackColor]];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"ImageCell" bundle:nil] forCellWithReuseIdentifier:@"customCell"];
    
    [self.view addSubview: self.collectionView];
}


- (ImageCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"customCell" forIndexPath:indexPath];
    [cell setDelegate:self]; // imagecollectionvc: imagecell's delegate
    
  
    NSDictionary *tempDictionary = [self.apiResponse.images objectAtIndex:indexPath.row];
    NSString *cellMovieID = tempDictionary[@"Movie ID"];
    NSString *cellImageUrl =  tempDictionary[@"Image Url"];
    
    // call set movie id and image url method in cell's implementation
    [cell setMovieID:cellMovieID andWithImageUrl:cellImageUrl];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.apiResponse.images count];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
     return CGSizeMake(collectionView.bounds.size.width, collectionView.bounds.size.height/3.5);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 0, 5, 0);
}

- (void)viewButtonTapped:(UIImageView *)thumbnailView {
    
    ImageViewController *imageVC = [[ImageViewController alloc] init];
    imageVC.image = [thumbnailView image];
    NSLog(@"imagevc's image that is passed is %@", imageVC.image);
    
    [self.navigationController pushViewController:imageVC animated:YES];
    
}

// for when bounds of collection view changes
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

@end
