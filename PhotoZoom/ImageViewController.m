//
//  ImageViewController.m
//  PhotoZoom
//
//  Created by Kylie Tram Le on 1/18/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.image = [[Image alloc] init];
    
    self.fullScreenImageView = [[UIImageView alloc] init];
    self.fullScreenImageView.frame = CGRectMake(20, 100, 280, 20);
    [self.view addSubview:self.fullScreenImageView];
}

- (void)viewWillAppear:(BOOL)animated {
    self.imageUrl = self.image.imageUrl;
}

@end
