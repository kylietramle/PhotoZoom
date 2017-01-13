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

@interface ImageItemViewController ()
@property (nonatomic, strong) NSURLSession *session;
@end


@implementation ImageItemViewController

// create NSURLSession object
- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self. navigationItem.title = @"Images";
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:config delegate:nil delegateQueue:nil];
        
        [self fetchFeed];
    }
    
    return self;
}

// create NSURLRequest and asks for list of images
- (void)fetchFeed
{
    NSString *requestString = @"https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed";
    NSURL *url = [NSURL URLWithString:requestString];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:req completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@", json);
    }];
    
    [dataTask resume];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return [[[ImageItemStore sharedImage] allImageItems] count];
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Create an instance of UITableViewCell
//    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
//    NSArray *images = [[ImageItemStore sharedImage] allImageItems];
//    ImageItem *image = images[indexPath.row];
//    
//    cell.textLabel.text = [image imageName];
//    
//    return cell;
    
    return nil;
}

// tell table view which kind of cell should instantiate if there are no cells to reuse
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

@end
