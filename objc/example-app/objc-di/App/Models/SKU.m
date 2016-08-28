/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "SKU.h"

@interface SKU ()
@property (nonatomic, strong) NSString *skuId;
@property (nonatomic, strong) NSString *shippingDetails;
@end

@implementation SKU

+ (instancetype)fromDictionary:(NSDictionary *)dict {
    SKU *sku = [[SKU alloc] init];
    sku.skuId = dict[@"skuid"];
    sku.shippingDetails = dict[@"shippingdetails"];
    return sku;
}

@end
