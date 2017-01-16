//
//  ImageCollectionViewController.m
//  PhotoZoom
//
//  Created by Kylie Tram Le on 1/15/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import "ImageCollectionViewController.h"

@interface ImageCollectionViewController ()
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, copy) NSArray *movies;
@end

@implementation ImageCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20) collectionViewLayout:flowLayout];
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    UINib *cellNib = [UINib nibWithNibName:@"ImageCell" bundle:nil];
    [collectionView registerNib:cellNib forCellWithReuseIdentifier:@"customCell"];

//    [collectionView registerClass: [UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self.view addSubview: collectionView];

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"customCell" forIndexPath:indexPath];
    
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width-20, 200);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 5);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexpath %@,", indexPath);
}

// create NSURLSession object
- (instancetype)init
{
    self = [super init];
    if (self) {
        self. navigationItem.title = @"Photos";

        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:config delegate:nil delegateQueue:nil];

        [self fetchFeed];
    }

    return self;
}

// create NSURLRequest and asks for list of images
- (void)fetchFeed
{
    NSString *requestString = @"https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed";
    NSURL *url = [NSURL URLWithString:requestString];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];

    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:req completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        self.movies = jsonObject[@"results"];
        
        self.image = [[Image alloc]init];
        self.image.movieID = movies.
        
        NSLog(@"%@", self.movies);

        dispatch_async(dispatch_get_main_queue(), ^{
            [self.view reloadData];
        });
    }];

    [dataTask resume];
}









@end
