//
//  Image.m
//  PhotoZoom
//
//  Created by Kylie Tram Le on 1/15/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import "Image.h"


@implementation Image

-(instancetype) init {
    self = [super init];
    
    return self;
}

- (instancetype) initWithJSON:(NSDictionary *)jsonDictionary
{
    self.movieID = jsonDictionary[@"id"];
    
    NSString *baseUrl = @"http://image.tmdb.org/t/p/w500";
    NSString *backDropUrl = jsonDictionary[@"backdrop_path"];
    
    self.imageUrl = [NSString stringWithFormat:@"%@%@", baseUrl, backDropUrl];
    
    return self;
}

+ (NSMutableArray *)convertJsonToImageObject:(NSArray *)jsonArray
{
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (NSDictionary *jsonDictionary in jsonArray)
    {
        Image *image = [[Image alloc] initWithJSON:jsonDictionary];
        
        [images addObject:image];
//        NSLog(@"%@", images);
    }
    return images;
}

@end
