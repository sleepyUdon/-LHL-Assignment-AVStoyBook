//
//  PageViewController.m
//  AVStoryBook
//
//  Created by Viviane Chan on 2016-07-16.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import "PageViewController.h"
#import "Photos.h"
#import "ViewController.h"

@interface PageViewController ()<UIPageViewControllerDataSource>
@property (nonatomic, copy)NSArray <Photos*>* photos;
@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createData];
    self.dataSource = self;
}

#pragma pageview datasource

//- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
//    NSInteger index = ((ViewController *)viewController).index;
//    if (index <= 0) {
//        return nil;
//    }
//    index -= 1;
//    ViewController *vc = [self createViewControllerWithIndex:index];
//    return vc;
//}
//
//- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
//    NSInteger index = ((ViewController *)viewController).index;
//    if (index >= self.photos.count-1) {
//        return nil;
//    }
//    index += 1;
//    ViewController *vc = [self createViewControllerWithIndex:index];
//    return vc;
//}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return self.photos.count;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    NSInteger index = ((ViewController *)pageViewController.viewControllers[0]).index;
    return index;
}

#pragma mark - Data
- (void)createData {
    NSMutableArray *temp = [NSMutableArray array];
    
    for (NSInteger i = 1; i < 11; ++i) {
        NSString *name = @(i).stringValue;
        Photos *photo = [[Photos alloc] initWithImageName:name];
        [temp addObject:photo];
    }
    self.photos = temp;
}

@end
