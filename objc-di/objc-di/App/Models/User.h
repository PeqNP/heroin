/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong, readonly) NSString *sessionId;

- (instancetype)initWithSessionId:(NSString *)sessionId NS_DESIGNATED_INITIALIZER;

@end
