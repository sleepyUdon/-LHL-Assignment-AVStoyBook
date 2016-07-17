//
//  Photos.m
//  AVStoryBook
//
//  Created by Viviane Chan on 2016-07-16.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import "Photos.h"

@implementation Photos


- (instancetype)initWithImageName:(NSString *)imageName {
    if (self = [super init]) {
        _photo = [UIImage imageNamed:imageName];
    }
    return self;
}

@end
