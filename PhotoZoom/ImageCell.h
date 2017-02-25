//
//  ImageCell.h
//  PhotoZoom
//
//  Created by Kylie Tram Le on 1/13/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ViewButtonDelegate <NSObject>
- (void)sendImageUrl:(NSString *)imageUrl;
@end

@interface ImageCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;
@property (weak, nonatomic) IBOutlet UIButton *viewButton;
@property (weak, nonatomic) id<ViewButtonDelegate>delegate;

@end
