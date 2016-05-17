/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>

@class HTTPRequest;
@class MetricsService;

@interface MainAssembly : NSObject

@property (nonatomic, strong, readonly) HTTPRequest *httpRequest;
@property (nonatomic, strong, readonly) MetricsService *metricsService;

+ (MainAssembly *)getInstance;

- (instancetype)initWithConfiguration:(NSDictionary *)config;
- (void)setInstance;

@end
