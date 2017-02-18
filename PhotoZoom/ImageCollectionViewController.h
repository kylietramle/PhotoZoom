//
//  ImageCollectionViewController.h
//  PhotoZoom
//
//  Created by Kylie Tram Le on 1/15/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageResults.h"
#import "APIResponse.h"

@interface ImageCollectionViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) ImageResults *imageResults;
@property(strong, nonatomic) UICollectionView *collectionView;
@property(strong, nonatomic) APIResponse *apiResponse;
@end
