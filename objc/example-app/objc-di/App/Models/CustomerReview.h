/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>

@interface CustomerReview : NSObject

@property (nonatomic, strong, readonly) NSString *customerAlias;
@property (nonatomic, strong, readonly) NSString *message;
@property (nonatomic, assign, readonly) float rating; // 1.0 - 5.0

+ (instancetype)fromDictionary:(NSDictionary *)dict;

@end
