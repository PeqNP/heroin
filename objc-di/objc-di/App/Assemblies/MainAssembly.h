/**
 
 TODO:
 - Rename httpRequest to serviceRequest and change corresponding config.
 
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "DIAssembly.h"

@class HTTPRequest;
@class MetricsService;
@class ProductService;
@class User;

@interface MainAssembly : NSObject <DIAssembly>

@property (nonatomic, strong, readonly) HTTPRequest *secureRequest;
@property (nonatomic, strong, readonly) HTTPRequest *imageRequest;
@property (nonatomic, strong, readonly) MetricsService *metricsService;
@property (nonatomic, strong, readonly) ProductService *productService;
@property (nonatomic, strong, readonly) User *user;

- (instancetype)initWithConfiguration:(NSDictionary *)config;

@end
