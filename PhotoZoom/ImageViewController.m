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

- (id)init {
    self = [super initWithNibName:@"ImageViewController" bundle:nil];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.contentSize = CGSizeMake(375, 800);
    self.imageView.frame = CGRectMake(0, 0, 250, 533);
    
    NSString *cellImageUrl =  self.imageDictionary[@"Image URL"];
    NSLog(@"%@", cellImageUrl);
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:cellImageUrl]];
    
    NSLog(@"%@", self.imageView);
}


@end
