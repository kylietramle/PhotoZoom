//
//  ImageItem.m
//  PhotoZoom
//
//  Created by Kylie Tram Le on 1/13/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import "ImageItem.h"

NSString *baseImageUrl  = @"http://image.tmdb.org/t/p/w500";

@implementation ImageItem
- (instancetype)initWithMovieID:(int *)id imageUrl:(NSMutableString *)url
{
    self = [super init];
    
    if (self) {
        self.movieID = id;
        self.imageUrl =  [[baseImageUrl stringByAppendingString:url] mutableCopy];
    }
    
    return self;
}
@end
