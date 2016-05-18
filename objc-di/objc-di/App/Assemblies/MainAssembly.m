/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "MainAssembly.h"
#import "HTTPRequest.h"
#import "MetricsService.h"
#import "User.h"

@interface MainAssembly ()
@property (nonatomic, strong) HTTPRequest *httpRequest;
@property (nonatomic, strong) MetricsService *metricsService;
@property (nonatomic, strong) User *user;
@end

static MainAssembly *sInstance;

@implementation MainAssembly


- (instancetype)initWithConfiguration:(NSDictionary *)config {
    self = [super init];
    if (self) {
        self.httpRequest = [[HTTPRequest alloc] initWithBaseUrl:config[@"http-base-url"]];
        self.metricsService = [[MetricsService alloc] initWithAppKey:config[@"metrics-app-key"]];
        self.user = [self getUserFromCache];
    }
    return self;
}

#pragma mark - DIAssembly

+ (MainAssembly *)getInstance {
    return sInstance;
}

- (void)setInstance {
    sInstance = self;
}

#pragma mark - Private

- (User *)getUserFromCache {
    return [[User alloc] initWithSessionId:@"cached-session-id"];
}

@end
