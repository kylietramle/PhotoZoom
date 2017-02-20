//
//  ImageViewController.h
//  PhotoZoom
//
//  Created by Kylie Tram Le on 1/18/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Image.h"

@interface ImageViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) NSDictionary *imageDictionary;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
