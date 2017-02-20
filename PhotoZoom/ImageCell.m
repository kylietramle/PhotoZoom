//
//  ImageCell.m
//  PhotoZoom
//
//  Created by Kylie Tram Le on 1/13/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import "ImageCell.h"
#import "Image.h"

@implementation ImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        // Initialization code
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"ImageCell" owner:self options:nil];
        
        if ([arrayOfViews count] < 1) {
            return nil;
        }
        
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        
        self = [arrayOfViews objectAtIndex:0];
        
        
    }
    
    return self;
    
}

@end
