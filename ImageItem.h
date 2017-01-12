//
//  ImageItem.h
//  PhotoZoom
//
//  Created by Kylie Tram Le on 1/12/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageItem : NSObject

@property (nonatomic) NSString *imageName;

+ (instancetype)randomImage; // let's see where I need this
- (instancetype)initWithItemName:(NSString *)name;
@end
