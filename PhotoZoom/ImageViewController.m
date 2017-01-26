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
    
    self.scrollView.contentSize = CGSizeMake(450, 660);
    self.imageView.frame = CGRectMake(0, 0, 375, 211);
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    NSString *cellImageUrl =  self.imageDictionary[@"Image URL"];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:cellImageUrl]];
    
    self.scrollView.delegate = self;
    self.scrollView.minimumZoomScale = 1.0;
    self.scrollView.maximumZoomScale = 100.0;
}

- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}



@end
