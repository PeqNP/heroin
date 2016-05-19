/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>

@interface SKU : NSObject

@property (nonatomic, strong, readonly) NSString *skuId;
@property (nonatomic, strong, readonly) NSString *shippingDetails;

+ (instancetype)fromDictionary:(NSDictionary *)dict;

@end
