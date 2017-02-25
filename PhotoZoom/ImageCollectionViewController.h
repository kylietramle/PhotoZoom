//
//  ImageCollectionViewController.h
//  PhotoZoom
//
//  Created by Kylie Tram Le on 1/15/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Image.h"
#import "APIResponse.h"
#import "ImageCell.h"

@interface ImageCollectionViewController : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, ViewButtonDelegate>

@property (strong, nonatomic) NSArray *images;
@property(strong, nonatomic) UICollectionView *collectionView;
@property(strong, nonatomic) APIResponse *apiResponse;
@end
