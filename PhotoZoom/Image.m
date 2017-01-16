//
//  Image.m
//  PhotoZoom
//
//  Created by Kylie Tram Le on 1/15/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import "Image.h"

NSString *baseUrl = @"http://image.tmdb.org/t/p/w500";

@implementation Image

-(id) init {
    self = [self initWithID:@"N/A" imageUrlString:@"N/A"];
    
    return self;
}

-(id) initWithID:(NSString *)id
    imageUrlString:(NSString *)urlString;
{
    self = [super init];
    if (self) {
        self.movieID = id;
        self.imageUrl = [NSString stringWithFormat:@"%@%@", baseUrl, urlString];
    }
    return self;
}
@end
