/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "MetricsService.h"

@interface MetricsService ()
@property (nonatomic, strong) NSString *appKey;
@end

@implementation MetricsService

- (instancetype)init {
    [self doesNotRecognizeSelector:_cmd];
    return [self initWithAppKey:nil];
}

- (instancetype)initWithAppKey:(NSString *)appKey {
    self = [super init];
    if (self) {
        self.appKey = appKey;
    }
    return self;
}

- (void)logEvent:(NSString *)event {
    // TODO: Log an event...
}

@end
