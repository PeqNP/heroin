/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "Product.h"
#import "SKU.h"

@interface Product ()
@property (nonatomic, strong) NSString *productId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSArray<SKU *> *skus;
@property (nonatomic, strong) NSArray<NSURL *> *imageUrls;
@end

@implementation Product

+ (instancetype)fromDictionary:(NSDictionary *)dict {
    Product *product = [[Product alloc] init];
    product.productId = dict[@"productid"];
    product.name = dict[@"name"];
    
    NSMutableArray<SKU *> *skus = [NSMutableArray array];
    for (NSDictionary *sku in dict[@"skus"]) {
        [skus addObject:[SKU fromDictionary:sku]];
    }
    product.skus = skus;
    
    NSMutableArray<NSURL *> *imageUrls = [NSMutableArray array];
    for (NSString *imageUrl in dict[@"imageurls"]) {
        [imageUrls addObject:[NSURL URLWithString:imageUrl]];
    }
    product.imageUrls = imageUrls;
    
    return product;
}

@end
