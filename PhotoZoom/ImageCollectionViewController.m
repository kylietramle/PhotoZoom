//
//  ImageCollectionViewController.m
//  PhotoZoom
//
//  Created by Kylie Tram Le on 1/15/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import "AFNetworking.h"
#import "ImageCollectionViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "ImageViewController.h"
#import "Image.h"
#import "ImageCell.h"

@interface ImageCollectionViewController ()
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, copy) NSArray *images;
@end

@implementation ImageCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchFeed];
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20) collectionViewLayout:flowLayout];
    
    collectionView.delegate = self;
    collectionView.dataSource = self;

    [collectionView registerClass:[ImageCell class] forCellWithReuseIdentifier:@"customCell"];
    
    [self.view addSubview: collectionView];

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"customCell" forIndexPath:indexPath];
  
    // set button text & method when tapped
    NSString *cellMovieID = [self.images [indexPath.row] movieID];
    [cell.viewButton setTitle:cellMovieID forState:UIControlStateNormal];
    [cell.viewButton addTarget:self action:@selector(viewButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    // load image asynchronously using SDWebImage
    NSString *cellImageUrl = [self.images [indexPath.row] imageUrl];
    [cell.thumbnailView sd_setImageWithURL:[NSURL URLWithString:cellImageUrl]];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.images count];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, 170);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 0, 5, 0);
}

// create NSURLSession object
//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        self. navigationItem.title = @"Photos";
//
//        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
//        _session = [NSURLSession sessionWithConfiguration:config delegate:nil delegateQueue:nil];
//
//        [self fetchFeed];
//    }
//
//    return self;
//}

// create NSURLRequest and asks for list of images
//- (void)fetchFeed
//{
//    NSString *requestString = @"https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed";
//    NSURL *url = [NSURL URLWithString:requestString];
//    NSURLRequest *req = [NSURLRequest requestWithURL:url];
//
//    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:req completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        NSMutableArray *tempImagesArray = [Image convertJsonToImageObject:(NSArray *)jsonObject[@"results"]];
//        self.images = [[NSArray alloc] initWithArray:tempImagesArray];
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.collectionView reloadData];
//        });
//    }];
//
//    [dataTask resume];
//}

- (void)fetchFeed {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

    NSURL *URL = [NSURL URLWithString:@"https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];

    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
        NSLog(@"Error: %@", error);
        } else {
            NSDictionary *resultsJSON = responseObject[@"results"];
            for (NSDictionary *movieImageDictionary in resultsJSON) {
                self.image = [[Image alloc] init];
                self.image.movieID = [NSString stringWithFormat:@"%@", movieImageDictionary[@"id"]];

                NSString *baseUrl = @"http://image.tmdb.org/t/p/w500";
                NSString *backDropUrl = movieImageDictionary[@"backdrop_path"];
                self.image.imageUrl = [NSString stringWithFormat:@"%@%@", baseUrl, backDropUrl];
            }
        }
    }];
    
    [dataTask resume];
}

- (IBAction)viewButtonTapped:(UIButton *)sender {
    ImageViewController *imageVC = [[ImageViewController alloc] init];
    
    UICollectionViewCell *cell = (UICollectionViewCell *)[[sender superview] superview];
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    imageVC.image = self.images[indexPath.row];
    
    NSLog(@"%@", imageVC.image);
    
    [self.navigationController pushViewController:imageVC animated:YES];
}

@end
