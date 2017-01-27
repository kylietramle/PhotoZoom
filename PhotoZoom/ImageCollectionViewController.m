//
//  ImageCollectionViewController.m
//  PhotoZoom
//
//  Created by Kylie Tram Le on 1/15/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import "ImageCollectionViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "ImageViewController.h"
#import "ImageResults.h"
#import "ImageCell.h"
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@implementation ImageCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageResults = [[ImageResults alloc] init];
    
    // listen for notification that json finished loading
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dataRetrieved) name:@"initWithJSONFinishedLoading" object:nil];
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20) collectionViewLayout:flowLayout];
    
    [self.collectionView setBackgroundColor:[UIColor blackColor]];

    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;

    [self.collectionView registerClass:[ImageCell class] forCellWithReuseIdentifier:@"customCell"];
    
    [self.view addSubview: self.collectionView];

}

- (void) dataRetrieved {
    [self.collectionView reloadData];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"customCell" forIndexPath:indexPath];
  
    // set button text & method when tapped
    NSDictionary *tempDictionary = [self.imageResults.images objectAtIndex:indexPath.row];
    NSString *cellMovieID = tempDictionary[@"Movie ID"];
    [cell.viewButton setTitle:cellMovieID forState:UIControlStateNormal];
    [cell.viewButton addTarget:self action:@selector(viewButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    // load image asynchronously using SDWebImage
    NSString *cellImageUrl =  tempDictionary[@"Image URL"];
    [cell.thumbnailView sd_setImageWithURL:[NSURL URLWithString:cellImageUrl]];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.imageResults.images count];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

     return CGSizeMake(collectionView.bounds.size.width, 250);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 0, 5, 0);
}

- (IBAction)viewButtonTapped:(UIButton *)sender {
    ImageViewController *imageVC = [[ImageViewController alloc] init];
    
    UICollectionViewCell *cell = (UICollectionViewCell *)[[sender superview] superview];
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    imageVC.imageDictionary = [self.imageResults.images objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:imageVC animated:YES];
}

// for when bounds of collection view changes
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

@end
