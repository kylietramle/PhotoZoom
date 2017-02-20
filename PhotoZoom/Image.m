//
//  Image.m
//  PhotoZoom
//
//  Created by Kylie Tram Le on 1/15/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import "Image.h"
#import "APIResponse.h"

static NSString *const baseUrl = @"http://image.tmdb.org/t/p/w500";

@implementation Image

-(id)initWithDictionary:(NSDictionary *)sourceDictionary {
    self = [super init];
    
    if (self) {
        if (sourceDictionary[@"id"]) {
            self.movieID = [NSString stringWithFormat:@"%@", sourceDictionary[@"id"]];
        } else {
            self.movieID = @"N/A";
        }
        
        if (sourceDictionary[@"backdrop_path"]) {
            NSString *backDropUrl = sourceDictionary[@"backdrop_path"];
            self.imageUrl = [NSString stringWithFormat:@"%@%@", baseUrl, backDropUrl];
        } else {
            self.imageUrl = @"https://us.v-cdn.net/6025034/uploads/ipb/monthly_05_2015/post-271677-0-79175800-1430873920.jpg";
        }
        
    }
    
    return self;
}

@end

