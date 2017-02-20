//
//  APIResponse.h
//  PhotoZoom
//
//  Created by Kylie Tram Le on 2/6/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface APIResponse : NSObject
@property(strong, nonatomic) NSMutableArray *images;
@end
