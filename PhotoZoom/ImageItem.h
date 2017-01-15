//
//  ImageItem.h
//  PhotoZoom
//
//  Created by Kylie Tram Le on 1/13/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageItem : NSObject

@property  int *movieID;
@property NSMutableString *imageUrl;

- (instancetype)initWithMovieID: (int *)id imageUrl: (NSString *)url;
+ (instancetype)convertImage;
@end
