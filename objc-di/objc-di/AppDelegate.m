/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "AppDelegate.h"
#import "MainAssembly.h"
#import "ProductDetailsAssembly.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[[MainAssembly alloc] initWithConfiguration:@{
        @"http-base-url": @"https://secure-api.example.com",
        @"metrics-api-key": @"1234abcd"
    }] setInstance];
    [[[ProductDetailsAssembly alloc] init] setInstance];
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

@end
