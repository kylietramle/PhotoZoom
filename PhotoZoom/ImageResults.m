//
//  Image.m
//  PhotoZoom
//
//  Created by Kylie Tram Le on 1/15/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import "ImageResults.h"
#import "AFNetworking.h"


@implementation ImageResults

- (id) init {
    self = [self initWithJSON];
    return self;
}

-(id) initWithJSON {
    self = [super init];
    
    if (self) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        
        NSURL *URL = [NSURL URLWithString:@"https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"];
        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
        
        NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
            if (error) {
                NSLog(@"Error: %@", error);
            } else {
                NSDictionary *resultsJSON = responseObject[@"results"];
                self.images = [NSMutableArray arrayWithCapacity: resultsJSON.count];
                for (NSDictionary *movieImageDictionary in resultsJSON) {
                    self.movieID = [NSString stringWithFormat:@"%@", movieImageDictionary[@"id"]];
                    
                    NSString *baseUrl = @"http://image.tmdb.org/t/p/w500";
                    NSString *backDropUrl = movieImageDictionary[@"backdrop_path"];
                    self.imageUrl = [NSString stringWithFormat:@"%@%@", baseUrl, backDropUrl];
                    
                    [self.images addObject:@{@"Movie ID":self.movieID, @"Image URL":self.imageUrl}];
                    
                }
                
            }
            // Notify that json finished loading
            [[NSNotificationCenter defaultCenter] postNotificationName:@"initWithJSONFinishedLoading" object:nil];
        }];
        
        [dataTask resume];
    }
    
    return self;
}


@end
