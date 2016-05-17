/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "MainAssembly.h"
#import "HTTPRequest.h"
#import "MetricsService.h"

@interface MainAssembly ()
@property (nonatomic, strong) HTTPRequest *httpRequest;
@property (nonatomic, strong) MetricsService *metricsService;
@end

static MainAssembly *sInstance;

@implementation MainAssembly

+ (MainAssembly *)getInstance {
    return sInstance;
}

- (instancetype)initWithConfiguration:(NSDictionary *)config {
    self = [super init];
    if (self) {
        self.httpRequest = [[HTTPRequest alloc] initWithBaseUrl:config[@"http-base-url"]];
        self.metricsService = [[MetricsService alloc] initWithAppKey:config[@"metrics-app-key"]];
    }
    return self;
}

- (void)setInstance {
    sInstance = self;
}

@end
