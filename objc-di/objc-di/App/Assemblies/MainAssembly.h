/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "DIAssembly.h"

@class HTTPRequest;
@class MetricsService;

@interface MainAssembly : NSObject <DIAssembly>

@property (nonatomic, strong, readonly) HTTPRequest *httpRequest;
@property (nonatomic, strong, readonly) MetricsService *metricsService;

- (instancetype)initWithConfiguration:(NSDictionary *)config;

@end
