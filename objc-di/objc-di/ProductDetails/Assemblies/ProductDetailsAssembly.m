/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "ProductDetailsAssembly.h"
#import "MainAssembly.h"
#import "MetricsService.h"
#import "di.h"

@interface ProductDetailsAssembly ()
di_property(MetricsService, metricsService)
@end

static ProductDetailsAssembly *sInstance;

@implementation ProductDetailsAssembly

di_inject(MainAssembly, MetricsService, metricsService)

#pragma mark - DIAssembly

+ (instancetype)getInstance {
    return sInstance;
}

- (void)setInstance {
    sInstance = self;
}

@end
