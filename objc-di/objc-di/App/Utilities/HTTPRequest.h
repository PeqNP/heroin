/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>

@class KSPromise;

@interface HTTPRequest : NSObject

- (instancetype)initWithBaseUrl:(NSString *)baseUrl NS_DESIGNATED_INITIALIZER;
- (KSPromise *)requestUrl:(NSURL *)url post:(NSDictionary *)post;
- (KSPromise *)requestUrl:(NSURL *)url get:(NSDictionary *)get;

@end
