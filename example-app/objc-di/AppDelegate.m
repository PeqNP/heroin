/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "AppDelegate.h"
#import "App.h"
#import "ProductCatalogViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [App appWithConfig:@{
        @"secure-base-url": @"https://secure-api.example.com",
        @"image-service-base-url": @"https://image.example.com",
        @"metrics-api-key": @"1234abcd"
    }];
    
    ProductCatalogViewController *catalogViewController = [[ProductCatalogViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:catalogViewController];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

@end
