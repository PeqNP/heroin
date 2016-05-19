/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>

@class SKU;

@interface Product : NSObject

@property (nonatomic, strong, readonly) NSString *productId;
@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSArray<SKU *> *skus;

+ (instancetype)fromDictionary:(NSDictionary *)dict;

@end
