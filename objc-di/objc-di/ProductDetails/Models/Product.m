/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "Product.h"

@interface Product ()
@property (nonatomic, strong) NSString *productId;
@property (nonatomic, strong) NSString *name;
@end

@implementation Product

+ (instancetype)productFromDictionary:(NSDictionary *)dict {
    Product *product = [[Product alloc] init];
    product.productId = dict[@"productid"];
    product.name = dict[@"name"];
    return product;
}

@end
