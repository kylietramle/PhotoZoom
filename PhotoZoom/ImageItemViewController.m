//
//  ImageItemViewController.m
//  PhotoZoom
//
//  Created by Kylie Tram Le on 1/12/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import "ImageItemViewController.h"
#import "ImageItemStore.h"
#import "ImageItem.h"

@implementation ImageItemViewController
- (instancetype)init
{
    // Call superclass's designatged initializer
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        for (int i = 0; i < 5; i++) {
            [[ImageItemStore sharedImage] createImage];
        }
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[ImageItemStore sharedImage] allImageItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Create an instance of UITableViewCell
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    
    NSArray *images = [[ImageItemStore sharedImage] allImageItems];
    ImageItem *image = images[indexPath.row];
    
    cell.textLabel.text = [image imageName];
    
    return cell;
}

@end
