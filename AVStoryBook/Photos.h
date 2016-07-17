//
//  Photos.h
//  AVStoryBook
//
//  Created by Viviane Chan on 2016-07-16.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Photos : NSObject


- (instancetype)initWithImageName:(NSString *)imageName;
@property (nonatomic) UIImage *photo;

@end
