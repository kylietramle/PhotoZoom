//
//  Image.h
//  PhotoZoom
//
//  Created by Kylie Tram Le on 1/15/17.
//  Copyright © 2017 Kylie Tram Le. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Image : NSObject

@property(strong, nonatomic) NSString *movieID;
@property(strong, nonatomic) NSString *imageUrl;

-(id)initWithDictionary:(NSDictionary *)sourceDictionary;

@end
