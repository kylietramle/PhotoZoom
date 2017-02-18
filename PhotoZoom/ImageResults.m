//
//  Image.m
//  PhotoZoom
//
//  Created by Kylie Tram Le on 1/15/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import "ImageResults.h"
#import "APIResponse.h"

static NSString *const baseUrl = @"http://image.tmdb.org/t/p/w500";

@implementation ImageResults

-(id)initWithDictionary:(NSDictionary *)sourceDictionary {
    self = [super init];
    
    if (self) {
        self.images = [NSMutableArray arrayWithCapacity: sourceDictionary.count];
        for (NSDictionary *movieImageDictionary in sourceDictionary) {
            self.movieID = [NSString stringWithFormat:@"%@", movieImageDictionary[@"id"]];
            
            NSString *backDropUrl = movieImageDictionary[@"backdrop_path"];
            self.imageUrl = [NSString stringWithFormat:@"%@%@", baseUrl, backDropUrl];
            
            [self.images addObject:@{@"Movie ID":self.movieID, @"Image URL":self.imageUrl}];
            NSLog(@"%@", self.images);
        }
        
    }
    
    return self;
}

@end

