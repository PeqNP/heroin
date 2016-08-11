/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>

@class KSPromise;

@interface HTTPRequest : NSObject

- (instancetype)initWithBaseUrl:(NSString *)baseUrl NS_DESIGNATED_INITIALIZER;
- (KSPromise *)request:(NSString *)endpoint post:(NSDictionary *)post;
- (KSPromise *)request:(NSString *)endpoint get:(NSDictionary *)get;

@end
