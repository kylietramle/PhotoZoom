//
//  ImageViewController.m
//  PhotoZoom
//
//  Created by Kylie Tram Le on 1/18/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import "ImageViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", self.imageDictionary);
    
    self.fullScreenImageView = [[UIImageView alloc] init];
    self.fullScreenImageView.frame = self.view.frame;
    [self.view addSubview:self.fullScreenImageView];
}

- (void)viewWillAppear:(BOOL)animated {
    NSString *cellImageUrl =  self.imageDictionary[@"Image URL"];
    NSLog(@"%@", cellImageUrl);
    [self.fullScreenImageView sd_setImageWithURL:[NSURL URLWithString:cellImageUrl]];
}

@end
