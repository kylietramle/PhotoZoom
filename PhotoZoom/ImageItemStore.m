//
//  ImageItemStore.m
//  PhotoZoom
//
//  Created by Kylie Tram Le on 1/12/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import "ImageItemStore.h"
#import "ImageItem.h"


@interface ImageItemStore ()
@property (nonatomic) NSMutableArray *privateImages;
@end

@implementation ImageItemStore

+ (instancetype)sharedImage
{
    // statis variables not destroyed when method is done excuting
    static ImageItemStore *sharedImage;
    // Do I need to create a sharedStore?
    if (!sharedImage) {
        sharedImage = [[self alloc] initPrivate];
    }
    return sharedImage;
}

// raise error if [[BNRItemStore alloc] init] is called
- (instancetype)init
{
    [NSException raise:@"Singleton"
                format: @"Use +[ImageItemStore sharedImage]"];
    return nil;
}

// Real secret initializer
- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        _privateImages = [[NSMutableArray alloc]init]; // instantiate array privateImages
    }
    
    return self;
}

- (ImageItem *)createImage
{
    ImageItem *image = [ImageItem randomImage];
    [self.privateImages addObject:image];
    
    return image;
}

@end
