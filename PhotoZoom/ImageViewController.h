//
//  ImageViewController.h
//  PhotoZoom
//
//  Created by Kylie Tram Le on 1/18/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageResults.h"

@interface ImageViewController : UIViewController
@property (strong, nonatomic) NSDictionary *imageDictionary;
@property (strong, nonatomic) UIImageView *fullScreenImageView;
@end
