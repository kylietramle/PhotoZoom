//
//  APIResponse.m
//  PhotoZoom
//
//  Created by Kylie Tram Le on 2/6/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import "APIResponse.h"
#import "AFNetworking.h"
#import "Image.h"

static NSString *const apiURL = @"https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed";

@implementation APIResponse
- (id) init {
    self = [super init];
    
    if (self) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        
        NSURL *URL = [NSURL URLWithString:apiURL];
        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
        
        NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
            
            if (error) {
                
                // Alert message controller
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"FailedAPICallNotification" message: @"Failed to retrieve images" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok"
                                                                   style:UIAlertActionStyleDefault
                                                                 handler:nil];
                [alertController addAction:actionOk];
                
            } else {
                
                NSDictionary *resultsJSON = responseObject[@"results"];
                self.images = [[NSMutableArray alloc] initWithCapacity:resultsJSON.count];
                for (NSDictionary *movieImageDictionary in resultsJSON) {
                    Image *newImage = [[Image alloc] initWithDictionary:movieImageDictionary];
                    
                    [self.images addObject:@{@"Movie ID": newImage.movieID, @"Image Url": newImage.imageUrl}];
                }
                NSLog(@"%@", self.images);
                
            }
            
        }];
        
        [dataTask resume];
    }
    
    return self;
}
@end

