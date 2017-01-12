//
//  ImageItemStore.h
//  PhotoZoom
//
//  Created by Kylie Tram Le on 1/12/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ImageItem;
@interface ImageItemStore : NSObject

@property (nonatomic, readonly, copy) NSArray *allImageItems;
// + means class method, - means instance method
+ (instancetype)sharedImage;
- (ImageItem *)createImage;

@end
