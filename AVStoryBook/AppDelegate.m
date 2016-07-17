//
//  AppDelegate.m
//  AVStoryBook
//
//  Created by Viviane Chan on 2016-07-15.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
#pragma view controller set up
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIPageViewController *pageViewController = [[UIPageViewController alloc] init];
    self.window.rootViewController = pageViewController;
    
    ViewController *viewController = [[ViewController alloc]init];
    
    [pageViewController setViewControllers:@[viewController] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    [self.window makeKeyAndVisible];
    return YES;

    
}
//
//- (ViewController *)createViewControllerWithIndex:(NSInteger)index {
//    ViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
//    vc.index = index;
//    vc.photo = self.photos[index];
//    return vc;
//}
//
//
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
//
//- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
//    return self.photos.count;
//}
//
//- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
//    NSInteger index = ((ViewController *)pageViewController.viewControllers[0]).index;
//    return index;
//}
//
//#pragma mark - Data
//- (void)createData {
//    NSMutableArray *temp = [NSMutableArray array];
//    
//    for (NSInteger i = 1; i < 11; ++i) {
//        NSString *name = @(i).stringValue;
//        Photo *photo = [[Photo alloc] initWithImageName:name];
//        [temp addObject:photo];
//    }
//    self.photos = temp;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
