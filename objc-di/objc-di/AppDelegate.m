/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "AppDelegate.h"
#import "MainAssembly.h"
#import "MainDomain.h"
#import "ProductDetailsAssembly.h"
#import "ProductCatalogViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[[MainAssembly alloc] initWithConfiguration:@{
        @"http-base-url": @"https://secure-api.example.com",
        @"metrics-api-key": @"1234abcd"
    }] setInstance];
    
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
