/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "MainAssembly.h"
#import "HTTPRequest.h"
#import "MetricsService.h"
#import "User.h"
#import "ProductService.h"

@interface MainAssembly ()
@property (nonatomic, strong) HTTPRequest *secureRequest;
@property (nonatomic, strong) HTTPRequest *imageRequest;
@property (nonatomic, strong) MetricsService *metricsService;
@property (nonatomic, strong) ProductService *productService;
@property (nonatomic, strong) User *user;
@end

@implementation MainAssembly

- (instancetype)initWithConfiguration:(NSDictionary *)config {
    self = [super init];
    if (self) {
        _secureRequest = [[HTTPRequest alloc] initWithBaseUrl:config[@"secure-base-url"]];
        _imageRequest = [[HTTPRequest alloc] initWithBaseUrl:config[@"image-service-base-url"]];
        _metricsService = [[MetricsService alloc] initWithAppKey:config[@"metrics-app-key"]];
        _user = [self getUserFromCache];
        _productService = [[ProductService alloc] init];
    }
    return self;
}

#pragma mark - Private

- (User *)getUserFromCache {
    return [[User alloc] initWithSessionId:@"cached-session-id"];
}

@end
