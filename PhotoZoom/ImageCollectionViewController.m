//
//  ImageCollectionViewController.m
//  PhotoZoom
//
//  Created by Kylie Tram Le on 1/15/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import "ImageCollectionViewController.h"


@implementation ImageCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20) collectionViewLayout:flowLayout];
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [collectionView registerClass: [UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self.view addSubview: collectionView];

//    UINib *cellNib = [UINib nibWithNibName:@"NibCell" bundle:nil];
//    [_collectionView registerNib:cellNib forCellWithReuseIdentifier:@"cvCell"];

    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor=[UIColor greenColor];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width/2-20, 200);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 5);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}







@end
