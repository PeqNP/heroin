/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (nonatomic, strong, readonly) NSString *productId;
@property (nonatomic, strong, readonly) NSString *name;

+ (instancetype)productFromDictionary:(NSDictionary *)dict;

@end
