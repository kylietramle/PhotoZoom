//
//  ImageCell.m
//  PhotoZoom
//
//  Created by Kylie Tram Le on 1/13/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import "ImageCell.h"
#import "Image.h"
#import "APIResponse.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation ImageCell

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        // set button text & method when tapped
        APIResponse *apiResponse = [[APIResponse alloc] init];
        [self.viewButton setTitle:@"hello" forState:UIControlStateNormal];
//        for (NSDictionary *eachImage in apiResponse.images) {
//            
//        }
//        [self.viewButton setTitle:image.movieID forState:UIControlStateNormal];
//        [self.viewButton addTarget:self action:@selector(viewButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        // load image asynchronously using SDWebImage
//        [self.thumbnailView sd_setImageWithURL:[NSURL URLWithString:image.imageUrl]];
        
    }
    
    return self;
    
}

- (void)viewButtonTapped:(UIButton *)sender {
    [self.delegate sendImageUrl:self.viewButton.currentTitle];
}
@end
