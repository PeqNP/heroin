/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>

@interface MetricsService : NSObject

- (instancetype)initWithAppKey:(NSString *)appKey NS_DESIGNATED_INITIALIZER;
- (void)logEvent:(NSString *)event;

@end
