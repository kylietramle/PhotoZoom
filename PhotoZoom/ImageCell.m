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

- (IBAction)buttonClicked:(id)sender {
    [self.delegate viewButtonTapped:self.thumbnailView];
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // initialize code
    }
    return self;
}

-(void) setMovieID:(NSString *)movieID
   andWithImageUrl:(NSString *)imageUrl {
    
    [self.viewButton setTitle:movieID forState:UIControlStateNormal];
    [self.thumbnailView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
}

@end
