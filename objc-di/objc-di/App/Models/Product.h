/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>

@class SKU;

@interface Product : NSObject

@property (nonatomic, strong, readonly) NSString *productId;
@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *price;
@property (nonatomic, strong, readonly) NSArray<SKU *> *skus;
@property (nonatomic, strong, readonly) NSArray<NSURL *> *imageUrls;

+ (instancetype)fromDictionary:(NSDictionary *)dict;

@end
